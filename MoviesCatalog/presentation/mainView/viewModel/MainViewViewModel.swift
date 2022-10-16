//
//  MainViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation
import SwiftyUserDefaults

class MainViewViewModel: ObservableObject {
    @Published private(set) var mainViewDispalyingMode: MainViewDisaplyingMode = .authorization
    @Published private(set) var isSplashDisplaying = true

    private var authStatusObserver: DefaultsDisposable?

    private(set) var authorizationComponent: AuthorizationComponent?

    init(authorizationComponent: AuthorizationComponent? = nil) {
        self.authorizationComponent = authorizationComponent

        observeAuthStatus()
    }

    func executeSplashCountdown() {
        if isSplashDisplaying {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                isSplashDisplaying = false
            }
        }
    }

    func observeAuthStatus() {
        authStatusObserver = Defaults.observe(\.isAuthorized) { [self] update in
            if let isAuthorized = update.newValue,
               let isAuthorizedUnwrapped = isAuthorized {
                if isAuthorizedUnwrapped {
                    mainViewDispalyingMode = .homeScreen
                } else {
                    mainViewDispalyingMode = .authorization
                }
            }
        }
    }
}
