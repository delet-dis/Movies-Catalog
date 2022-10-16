//
//  LoginComponent.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 16.10.2022.
//

import Foundation
import NeedleFoundation
import SwiftUI

protocol LoginComponentDependency: Dependency {
    var authorizationComponent: AuthorizationComponent { get }
}

final class LoginComponent: Component<LoginComponentDependency> {
    var loginViewViewModel: LoginViewViewModel {
        shared {
            LoginViewViewModel(
                authorizationComponent: dependency.authorizationComponent
            )
        }
    }

    var loginView: some View {
        shared {
            LoginView()
                .environmentObject(loginViewViewModel)
        }
    }
}
