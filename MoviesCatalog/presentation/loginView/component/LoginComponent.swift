//
//  LoginComponent.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 16.10.2022.
//

import Foundation
import NeedleFoundation
import SwiftUI

protocol LoginComponentDependency: Dependency {}

final class LoginComponent: Component<LoginComponentDependency> {
    var authorizationComponent: AuthorizationComponent {
        shared {
            AuthorizationComponent(parent: self)
        }
    }

    var registrationComponent: RegistrationComponent {
        shared {
            RegistrationComponent(parent: self)
        }
    }

    var loginViewViewModel: LoginViewViewModel {
        shared {
            LoginViewViewModel(
                authorizationComponent: authorizationComponent,
                registrationComponent: registrationComponent
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
