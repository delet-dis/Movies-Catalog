//
//  MoviesViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import Foundation

class MoviesViewViewModel: ObservableObject {
    @Published private(set) var displayingHeaderMovie: DisplayingMovie?
    @Published private(set) var displayingMovies: [DisplayingMovie] = []
    @Published private(set) var displayingFavoriteMovies: [DisplayingFavotireMovie] = []

    @Published var isAlertShowing = false
    @Published private(set) var alertText = ""

    @Published var isMovieDetailsDisplaying = false
    @Published private(set) var displayingMovieId = ""

    private let getAuthStatusUseCase: GetAuthStatusUseCase
    private let getTokenUseCase: GetTokenUseCase
    private let getFavoritesUseCase: GetFavoritesUseCase
    private let deleteFavoriteUseCase: DeleteFavoriteUseCase
    private let loadMoviesAtPositionUseCase: LoadMoviesAtPositionUseCase

    let movieDetailsComponent: MovieDetailsComponent?

    private var displayingPage = 1

    init(
        getAuthStatusUseCase: GetAuthStatusUseCase,
        getTokenUseCase: GetTokenUseCase,
        getFavoritesUseCase: GetFavoritesUseCase,
        deleteFavoriteUseCase: DeleteFavoriteUseCase,
        loadMoviesAtPositionUseCase: LoadMoviesAtPositionUseCase,
        movieDetailsComponent: MovieDetailsComponent? = nil
    ) {
        self.getAuthStatusUseCase = getAuthStatusUseCase
        self.getTokenUseCase = getTokenUseCase
        self.getFavoritesUseCase = getFavoritesUseCase
        self.deleteFavoriteUseCase = deleteFavoriteUseCase
        self.loadMoviesAtPositionUseCase = loadMoviesAtPositionUseCase

        self.movieDetailsComponent = movieDetailsComponent
    }

    private func processError(_ error: Error) {
        alertText = error.localizedDescription
        isAlertShowing = true

        print(error)
    }

    func updateDisplayingData() {
        getDisplayingFavorites()

        getDispalyingMovies()
    }

    func getDisplayingFavorites() {
        getAuthStatusUseCase.execute { [self] result in
            switch result {
            case .success(let isAuthorized):
                if isAuthorized {
                    getTokenUseCase.execute { [self] result in
                        switch result {
                        case .success(let token):
                            getFavoritesUseCase.execute(token: token) { [self] result in
                                switch result {
                                case .success(let favorites):
                                    updateDisplayingFavorites(favorites)
                                case .failure(let error):
                                    processError(error)
                                }
                            }
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

    private func updateDisplayingFavorites(_ favorites: Favorites) {
        var tempDisplayingFavoriteMovies: [DisplayingFavotireMovie] = []

        favorites.movies.forEach { movie in
            tempDisplayingFavoriteMovies.append(DisplayingFavotireMovie(movie: movie) { [self] in
                displayMovie(movieId: movie.id)
            } deleteClosure: { [self] in
                deleteFavoriteMovie(movie)
            }
            )
        }

        displayingFavoriteMovies = tempDisplayingFavoriteMovies
    }

    private func deleteFavoriteMovie(_ movie: Movie) {
        getTokenUseCase.execute { [self] result in
            switch result {
            case .success(let token):
                deleteFavoriteUseCase.execute(token: token, id: movie.id) { [self] _ in
                    getDisplayingFavorites()
                }
            case .failure(let error):
                processError(error)
            }
        }
    }

    func getDispalyingMovies() {
        loadMoviesAtPositionUseCase.execute(displayingPage) { [self] result in
            switch result {
            case .success(let moviesPage):
                updateDisplayingMovies(moviesPage.movies)
            case .failure(let error):
                processError(error)
            }
        }
    }

    private func updateDisplayingMovies(_ movies: [Movie]) {
        if displayingPage == 1 {
            displayingMovies = []
        }

        movies.forEach { movie in
            displayingMovies.append(DisplayingMovie(movie: movie) { [self] in
                displayMovie(movieId: movie.id)
            })
        }

        updateHeaderMovie()
    }

    func requestMoreMovies() {
        displayingPage += 1

        getDispalyingMovies()
    }

    private func updateHeaderMovie() {
        displayingHeaderMovie = displayingMovies.first
    }

    func refreshDisplayingData() {
        displayingPage = 1

        getDispalyingMovies()
        getDisplayingFavorites()
    }

    private func displayMovie(movieId: String) {
        displayingMovieId = movieId
        isMovieDetailsDisplaying = true
    }
}
