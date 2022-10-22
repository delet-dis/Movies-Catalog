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

    private let getTokenUseCase: GetTokenUseCase
    private let getFavoritesUseCase: GetFavoritesUseCase
    private let deleteFavoriteUseCase: DeleteFavoriteUseCase

    init(
        getTokenUseCase: GetTokenUseCase,
        getFavoritesUseCase: GetFavoritesUseCase,
        deleteFavoriteUseCase: DeleteFavoriteUseCase
    ) {
        self.getTokenUseCase = getTokenUseCase
        self.getFavoritesUseCase = getFavoritesUseCase
        self.deleteFavoriteUseCase = deleteFavoriteUseCase
    }

    private func processError(_ error: Error) {
        alertText = error.localizedDescription
        isAlertShowing = true

        print(error)
    }

    func updateDisplayingFavorites() {
        getTokenUseCase.execute { [self] result in
            switch result {
            case .success(let token):
                getFavoritesUseCase.execute(token: token) { [self] result in
                    switch result {
                    case .success(let favorites):
                        updateDisplayingFavoriteMovies(favorites: favorites)
                    case .failure(let error):
                        processError(error)
                    }
                }
            case .failure(let error):
                processError(error)
            }
        }
    }

    private func updateDisplayingFavoriteMovies(favorites: Favorites) {
        displayingFavoriteMovies = []

        favorites.movies.forEach { movie in
            displayingFavoriteMovies.append(DisplayingFavotireMovie(movie: movie) {
                print("movie tap")
            } deleteClosure: { [self] in
                deleteFavoriteMovie(movie: movie)
            }
            )
        }
    }

    private func deleteFavoriteMovie(movie: Movie) {
        getTokenUseCase.execute { [self] result in
            switch result {
            case .success(let token):
                deleteFavoriteUseCase.execute(token: token, id: movie.id) { [self] _ in
                    updateDisplayingFavorites()
                }
            case .failure(let error):
                processError(error)
            }
        }
    }
}
