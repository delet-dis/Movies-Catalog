//
//  RegistrationComponent.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 17.10.2022.
//

import Foundation
import NeedleFoundation
import SwiftUI

protocol RegistrationComponentDependency: Dependency {
    var registerUseCase: RegisterUseCase { get }
    var saveAuthStatusUseCase: SaveAuthStatusUseCase { get }
    var saveTokenUseCase: SaveTokenUseCase { get }
}

final class RegistrationComponent: Component<RegistrationComponentDependency> {
    var registrationViweViewModel: RegistrationViewViewModel {
        shared {
            RegistrationViewViewModel(
                registerUseCase: dependency.registerUseCase,
                saveAuthStatusUseCase: dependency.saveAuthStatusUseCase,
                saveTokenUseCase: dependency.saveTokenUseCase
            )
        }
    }

    var registrationView: some View {
        shared {
            RegistrationView()
                .environmentObject(registrationViweViewModel)
        }
    }
}
