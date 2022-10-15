//
//  AuthorizationComponent.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation
import NeedleFoundation
import SwiftUI

protocol AuthorizationComponentDependency: Dependency {
    var loginUseCase: LoginUseCase { get }
}

final class AuthorizationComponent: Component<AuthorizationComponentDependency> {
    var authorizationViewViewModel: AuthorizationViewViewModel {
        shared {
            AuthorizationViewViewModel(
                loginUseCase: dependency.loginUseCase
            )
        }
    }

    var authorizationView: some View {
        shared {
            AuthorizationView()
                .environmentObject(authorizationViewViewModel)
        }
    }
}
