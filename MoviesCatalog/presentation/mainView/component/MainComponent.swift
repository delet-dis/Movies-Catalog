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

    var mainViewViewModel: MainViewViewModel {
        shared {
            MainViewViewModel()
        }
    }

    var mainView: some View {
        shared {
            MainView()
                .environmentObject(mainViewViewModel)
        }
    }
}
