//
//  MainComponent.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation
import NeedleFoundation
import SwiftUI

final class MainComponent: BootstrapComponent {
    var keychainRepository: KeychainRepository {
        shared {
            KeychainRepositoryImpl()
        }
    }

    var saveTokenUseCase: SaveTokenUseCase {
        shared {
            SaveTokenUseCase(keychainRepository: keychainRepository)
        }
    }

    var getTokenUseCase: GetTokenUseCase {
        shared {
            GetTokenUseCase(keychainRepository: keychainRepository)
        }
    }

    var saveAuthStatusUseCase: SaveAuthStatusUseCase {
        shared {
            SaveAuthStatusUseCase()
        }
    }

    var getAuthStatusUseCase: GetAuthStatusUseCase {
        shared {
            GetAuthStatusUseCase()
        }
    }

    var jsonDecoder: JSONDecoder {
        shared {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            return decoder
        }
    }

    var jsonEncoder: JSONEncoder {
        shared {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601

            return encoder
        }
    }

    var authRepository: AuthRepository {
        shared {
            AuthRepositoryImpl(jsonDecoder: jsonDecoder, jsonEncoder: jsonEncoder)
        }
    }

    var registerUseCase: RegisterUseCase {
        shared {
            RegisterUseCase(authRepository: authRepository)
        }
    }

    var loginUseCase: LoginUseCase {
        shared {
            LoginUseCase(authRepository: authRepository)
        }
    }

    var favoritesRepository: FavoritesRepository {
        shared {
            FavoritesRepositoryImpl(
                jsonDecoder: jsonDecoder,
                jsonEncoder: jsonEncoder,
                logoutUseCase: logoutUseCase
            )
        }
    }

    var getFavoritesUseCase: GetFavoritesUseCase {
        shared {
            GetFavoritesUseCase(favoritesRepository: favoritesRepository)
        }
    }

    var addFavoriteUseCase: AddFavoriteUseCase {
        shared {
            AddFavoriteUseCase(favoritesRepository: favoritesRepository)
        }
    }

    var deleteFavoriteUseCase: DeleteFavoriteUseCase {
        shared {
            DeleteFavoriteUseCase(favoritesRepository: favoritesRepository)
        }
    }

    var toggleFavoriteStatusUseCase: ToggleFavoriteStatusUseCase {
        shared {
            ToggleFavoriteStatusUseCase(favoritesRepository: favoritesRepository)
        }
    }

    var getFavoriteStatusUseCase: GetFavoriteStatusUseCase {
        shared {
            GetFavoriteStatusUseCase(favoritesRepository: favoritesRepository)
        }
    }

    var moviesRepository: MoviesRepositoryImpl {
        shared {
            MoviesRepositoryImpl(jsonDecoder: jsonDecoder, jsonEncoder: jsonEncoder)
        }
    }

    var loadMoviesAtPositionUseCase: LoadMoviesAtPositionUseCase {
        shared {
            LoadMoviesAtPositionUseCase(moviesRepository: moviesRepository)
        }
    }

    var loadMovieDetailsUseCase: LoadMovieDetailsUseCase {
        shared {
            LoadMovieDetailsUseCase(moviesRepository: moviesRepository)
        }
    }

    var logoutUseCase: LogoutUseCase {
        shared {
            LogoutUseCase(
                authRepository: authRepository,
                saveAuthStatusUseCase: saveAuthStatusUseCase,
                saveTokenUseCase: saveTokenUseCase
            )
        }
    }

    var profileRepository: ProfileRepository {
        shared {
            ProfileRepositoryImpl(jsonDecoder: jsonDecoder, jsonEncoder: jsonEncoder)
        }
    }

    var getUserProfileUseCase: GetUserProfileUseCase {
        shared {
            GetUserProfileUseCase(profileRepository: profileRepository)
        }
    }

    var saveUserProfileUseCase: SaveUserProfileUseCase {
        shared {
            SaveUserProfileUseCase(profileRepository: profileRepository)
        }
    }

    var loginComponent: LoginComponent {
        shared {
            LoginComponent(parent: self)
        }
    }

    var homeComponent: HomeComponent {
        shared {
            HomeComponent(parent: self)
        }
    }

    var mainViewViewModel: MainViewViewModel {
        shared {
            MainViewViewModel(
                getAuthStatusUseCase: getAuthStatusUseCase,
                loginComponent: loginComponent,
                homeComponent: homeComponent
            )
        }
    }

    var mainView: some View {
        shared {
            MainView()
                .environmentObject(mainViewViewModel)
        }
    }
}
