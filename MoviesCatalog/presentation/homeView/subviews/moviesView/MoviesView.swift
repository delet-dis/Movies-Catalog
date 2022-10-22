//
//  MoviesView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import SPAlert
import SwiftUI

struct MoviesView: View {
    @EnvironmentObject private var viewModel: MoviesViewViewModel

    @State private var isDisplayingFavoriteMovies = false

    var body: some View {
        ScrollView {
            VStack {
                HeaderMovieView(displayingMovie: viewModel.displayingHeaderMovie)

                if isDisplayingFavoriteMovies {
                    FavoriteMoviesView(displayingFavotireMovies: viewModel.displayingFavoriteMovies)
                } else {
                    EmptyView()
                }

                MoviesListView(displayingMovies: viewModel.displayingMovies)

                Spacer()
            }
        }
        .onAppear {
            isDisplayingFavoriteMovies = viewModel.displayingFavoriteMovies.isEmpty

            viewModel.updateDisplayingFavorites()
        }
        .ignoresSafeArea()
        .SPAlert(
            isPresent: $viewModel.isAlertShowing,
            message: viewModel.alertText,
            dismissOnTap: false,
            preset: .error,
            haptic: .error
        )
        .onReceive(viewModel.$displayingFavoriteMovies) { value in
            withAnimation(.default) {
                self.isDisplayingFavoriteMovies = !value.isEmpty
            }
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    private static let keychainRepository = KeychainRepositoryImpl()
    private static let authRepository =
        AuthRepositoryImpl(
            jsonDecoder: JSONDecoder(),
            jsonEncoder: JSONEncoder()
        )
    private static let favoritesRepository = FavoritesRepositoryImpl(
        jsonDecoder: JSONDecoder(),
        jsonEncoder: JSONEncoder(),
        logoutUseCase: LogoutUseCase(
            authRepository: authRepository,
            saveAuthStatusUseCase: saveAuthStatusUseCase,
            saveTokenUseCase: saveTokenUseCase
        )
    )

    private static let saveAuthStatusUseCase = SaveAuthStatusUseCase()

    private static let getTokenUseCase = GetTokenUseCase(keychainRepository: keychainRepository)
    private static let saveTokenUseCase = SaveTokenUseCase(keychainRepository: keychainRepository)

    private static let getFavoritesUseCase = GetFavoritesUseCase(favoritesRepository: favoritesRepository)
    private static let deleteFavoriteUseCase = DeleteFavoriteUseCase(favoritesRepository: favoritesRepository)

    static var previews: some View {
        MoviesView()
            .environmentObject(
                MoviesViewViewModel(
                    getTokenUseCase: getTokenUseCase,
                    getFavoritesUseCase: getFavoritesUseCase,
                    deleteFavoriteUseCase: deleteFavoriteUseCase
                ))
    }
}
