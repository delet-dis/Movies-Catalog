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

    var logoutUseCase: LogoutUseCase {
        shared {
            LogoutUseCase(authRepository: authRepository)
        }
    }

    var loginComponent: LoginComponent {
        shared {
            LoginComponent(parent: self)
        }
    }

    var mainViewViewModel: MainViewViewModel {
        shared {
            MainViewViewModel(
                loginComponent: loginComponent,
                getAuthStatusUseCase: getAuthStatusUseCase
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
