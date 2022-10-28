//
//  MovieDetailsViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 28.10.2022.
//

import Foundation

class MovieDetailsViewViewModel: ObservableObject {
    @Published private(set) var displayingDetailedMovie: DetailedMovie?

    @Published var isAlertShowing = false
    @Published private(set) var alertText = ""

    private var displayingMovieId: String = "" {
        didSet {
            updateDisplayingData()
        }
    }

    private let loadMovieDetailsUseCase: LoadMovieDetailsUseCase

    init(
        loadMovieDetailsUseCase: LoadMovieDetailsUseCase
    ) {
        self.loadMovieDetailsUseCase = loadMovieDetailsUseCase
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
                self.displayingDetailedMovie = detailedMovie

            case .failure(let error):
                processError(error)
            }
        }
    }
}
