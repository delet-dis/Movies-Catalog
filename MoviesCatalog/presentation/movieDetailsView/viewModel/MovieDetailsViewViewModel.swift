//
//  MovieDetailsViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 28.10.2022.
//

import Foundation

class MovieDetailsViewViewModel: ObservableObject {
    @Published private(set) var displayingDetailedMovie: DetailedMovie?
    @Published private(set) var displayingDetailedReviews: [DisplayingDetailedReview]?

    @Published private(set) var isFavorite = false

    @Published var isAlertShowing = false
    @Published private(set) var alertText = ""

    @Published private(set) var saveReviewClosure: ((ReviewRequest) -> Void)?
    @Published private(set) var isMovieReviewDialogDisplaying = false
    @Published private(set) var displayingReview: DetailedReview?

    private let getFavoriteStatusUseCase: GetFavoriteStatusUseCase
    private let toggleFavoriteStatusUseCase: ToggleFavoriteStatusUseCase
    private let getTokenUseCase: GetTokenUseCase
    private let getUserProfileUseCase: GetUserProfileUseCase
    private let loadMovieDetailsUseCase: LoadMovieDetailsUseCase
    private let addReviewUseCase: AddReviewUseCase
    private let editReviewUseCase: EditReviewUseCase
    private let deleteReviewUseCase: DeleteReviewUseCase

    private var displayingMovieId: String = "" {
        didSet {
            updateDisplayingData()
        }
    }

    init(
        loadMovieDetailsUseCase: LoadMovieDetailsUseCase,
        getFavoriteStatusUseCase: GetFavoriteStatusUseCase,
        toggleFavoriteStatusUseCase: ToggleFavoriteStatusUseCase,
        getTokenUseCase: GetTokenUseCase,
        getUserProfileUseCase: GetUserProfileUseCase,
        addReviewUseCase: AddReviewUseCase,
        editReviewUseCase: EditReviewUseCase,
        deleteReviewUseCase: DeleteReviewUseCase
    ) {
        self.loadMovieDetailsUseCase = loadMovieDetailsUseCase
        self.getFavoriteStatusUseCase = getFavoriteStatusUseCase
        self.toggleFavoriteStatusUseCase = toggleFavoriteStatusUseCase
        self.getTokenUseCase = getTokenUseCase
        self.getUserProfileUseCase = getUserProfileUseCase
        self.addReviewUseCase = addReviewUseCase
        self.editReviewUseCase = editReviewUseCase
        self.deleteReviewUseCase = deleteReviewUseCase
    }

    func setDisplayingMovieId(_ displayingMovieId: String) {
        self.displayingMovieId = displayingMovieId
    }

    private func processError(_ error: Error) {
        alertText = error.localizedDescription
        isAlertShowing = true

        print(error)
    }

    func updateDisplayingData() {
        loadMovieDetailsUseCase.execute(id: displayingMovieId) { [self] result in
            switch result {
            case .success(let detailedMovie):
                displayingDetailedMovie = detailedMovie

                updateDisplayingDetailedReviews()
                updateFavoriteStatus()
            case .failure(let error):
                processError(error)
            }
        }
    }

    private func updateFavoriteStatus() {
        getTokenUseCase.execute { [self] result in
            switch result {
            case .success(let token):
                getFavoriteStatusUseCase.execute(
                    token: token,
                    movieId: displayingMovieId
                ) { [self] result in
                    switch result {
                    case .success(let isFavorite):
                        self.isFavorite = isFavorite
                    case .failure(let error):
                        processError(error)
                    }
                }
            case .failure(let error):
                processError(error)
            }
        }
    }

    func toggleFavoriteState() {
        getTokenUseCase.execute { [self] result in
            switch result {
            case .success(let token):
                toggleFavoriteStatusUseCase.execute(
                    token: token,
                    movieId: displayingMovieId
                ) { [self] result in
                    switch result {
                    case .success(let status):
                        isFavorite = status
                    case .failure(let error):
                        processError(error)
                    }
                }
            case .failure(let error):
                processError(error)
            }
        }
    }

    func updateDisplayingDetailedReviews() {
        if let displayingDetailedMovie = displayingDetailedMovie,
           let reviews = displayingDetailedMovie.reviews {
            getTokenUseCase.execute { [self] result in
                switch result {
                case .success(let token):
                    getUserProfileUseCase.execute(token: token) { [self] result in
                        switch result {
                        case .success(let profile):
                            var tempDisplayingDetailedReviews: [DisplayingDetailedReview] = []

                            reviews.forEach { review in
                                tempDisplayingDetailedReviews.append(
                                    DisplayingDetailedReview(
                                        detailedReview: review,
                                        isUserReview: profile.id == review.author?.userId,
                                        editClosure: profile.id == review.author?.userId ? { [self] in
                                            displayingReview = review

                                            displayMovieReviewView(
                                                movieId: displayingDetailedMovie.id,
                                                review: review
                                            )
                                        } :
                                            nil,
                                        removeClosure:
                                        profile.id == review.author?.userId ? { [self] in
                                            deleteReview(reviewId: review.id)
                                        } :
                                            nil
                                    )
                                )
                            }

                            displayingDetailedReviews = tempDisplayingDetailedReviews
                        case .failure(let error):
                            processError(error)

                            displayingDetailedReviews = nil
                        }
                    }
                case .failure(let error):
                    processError(error)

                    displayingDetailedReviews = nil
                }
            }
        } else {
            displayingDetailedReviews = nil
        }
    }

    private func displayMovieReviewView(movieId: String, review: DetailedReview? = nil) {
        saveReviewClosure = { [self] reviewRequest in
            getTokenUseCase.execute { [self] result in
                switch result {
                case .success(let token):
                    displayingReview = review

                    if let review = review {
                        editReviewUseCase.execute(
                            token: token,
                            movieId: movieId,
                            reviewId: review.id,
                            review: reviewRequest
                        ) { [self] result in
                            switch result {
                            case .success:
                                updateDisplayingData()

                                saveReviewClosure = nil
                                isMovieReviewDialogDisplaying = false
                            case .failure(let error):
                                processError(error)
                            }
                        }
                    } else {
                        addReviewUseCase.execute(
                            token: token,
                            movieId: movieId,
                            review: reviewRequest
                        ) { [self] result in
                            switch result {
                            case .success:
                                updateDisplayingData()

                                saveReviewClosure = nil
                                isMovieReviewDialogDisplaying = false
                            case .failure(let error):
                                processError(error)
                            }
                        }
                    }

                case .failure(let error):
                    processError(error)
                }
            }
        }

        isMovieReviewDialogDisplaying = true
    }

    private func deleteReview(reviewId: String) {
        guard let displayingDetailedMovie = displayingDetailedMovie else {
            return
        }

        getTokenUseCase.execute { [self] result in
            switch result {
            case .success(let token):
                deleteReviewUseCase.execute(
                    token: token,
                    movieId: displayingDetailedMovie.id,
                    reviewId: reviewId
                ) { [self] result in
                    updateDisplayingData()

                    if case .failure(let error) = result {
                        processError(error)
                    }
                }
            case .failure(let error):
                processError(error)
            }
        }
    }

    func resetDisplayingData() {
        displayingDetailedMovie = nil
        displayingDetailedReviews = nil
        isFavorite = false
    }

    func hideMovieReviewDialog() {
        isMovieReviewDialogDisplaying = false
        displayingReview = nil
    }

    func showMovieReviewDialog() {
        displayMovieReviewView(movieId: displayingMovieId)
    }
}
