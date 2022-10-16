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

    var jsonDecoder: JSONDecoder {
        shared {
            JSONDecoder()
        }
    }

    var authRepository: AuthRepository {
        shared {
            AuthRepositoryImpl(jsonDecoder: jsonDecoder)
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

    var authorizationComponent: AuthorizationComponent {
        shared {
            AuthorizationComponent(parent: self)
        }
    }

    var mainViewViewModel: MainViewViewModel {
        shared {
            MainViewViewModel(
                authorizationComponent: authorizationComponent
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
