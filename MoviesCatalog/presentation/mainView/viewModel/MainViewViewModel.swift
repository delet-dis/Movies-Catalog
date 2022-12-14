//
//  MainViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation
import SwiftyUserDefaults

class MainViewViewModel: ObservableObject {
    @Published private(set) var mainViewDispalyingMode: MainViewDisaplyingModeEnum = .authorization
    @Published private(set) var isSplashDisplaying = true

    @Published var isAlertShowing = false
    @Published private(set) var alertText = ""

    private var authStatusObserver: DefaultsDisposable?

    private let getAuthStatusUseCase: GetAuthStatusUseCase

    private(set) var loginComponent: LoginComponent?
    private(set) var homeComponent: HomeComponent?

    init(
        getAuthStatusUseCase: GetAuthStatusUseCase,
        loginComponent: LoginComponent? = nil,
        homeComponent: HomeComponent? = nil
    ) {
        self.getAuthStatusUseCase = getAuthStatusUseCase

        self.homeComponent = homeComponent
        self.loginComponent = loginComponent

        getAuthStatus()

        observeAuthStatus()
    }

    func executeSplashCountdown() {
        if isSplashDisplaying {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                isSplashDisplaying = false
            }
        }
    }

    private func processError(_ error: Error) {
        alertText = error.localizedDescription
        isAlertShowing = true

        print(error)
    }

    func processAuthStatus(isAuthorized: Bool) {
        if isAuthorized {
            mainViewDispalyingMode = .homeScreen
        } else {
            mainViewDispalyingMode = .authorization
        }
    }

    func getAuthStatus() {
        getAuthStatusUseCase.execute { [self] result in
            switch result {
            case .success(let authStatus):
                processAuthStatus(isAuthorized: authStatus)
            case .failure(let error):
                processError(error)
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
