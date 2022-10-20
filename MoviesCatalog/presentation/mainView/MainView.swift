//
//  MainView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import SPAlert
import SwiftUI

struct MainView: View {
    @EnvironmentObject private var viewModel: MainViewViewModel

    @State private var displayingMode = MainViewDisaplyingModeEnum.authorization
    @State private var isSplashDisplaying = true

    var body: some View {
        ZStack {
            switch displayingMode {
            case .authorization:
                viewModel.loginComponent?.loginView
            case .homeScreen:
                viewModel.homeComponent?.homeView
            }

            SplashView()
                .opacity(isSplashDisplaying ? 1 : 0)
        }
        .SPAlert(
            isPresent: $viewModel.isAlertShowing,
            message: viewModel.alertText,
            dismissOnTap: false,
            preset: .error,
            haptic: .error
        )
        .onAppear {
            displayingMode = viewModel.mainViewDispalyingMode
            isSplashDisplaying = viewModel.isSplashDisplaying

            viewModel.executeSplashCountdown()
        }
        .onReceive(viewModel.$mainViewDispalyingMode) { value in
            withAnimation(.easeInOut(duration: 0.5)) {
                self.displayingMode = value
            }
        }
        .onReceive(viewModel.$isSplashDisplaying) { value in
            withAnimation(.easeInOut(duration: 0.5)) {
                self.isSplashDisplaying = value
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    private static let getAuthStatusUseCase = GetAuthStatusUseCase()

    static var previews: some View {
        MainView()
            .environmentObject(
                MainViewViewModel(
                    getAuthStatusUseCase: getAuthStatusUseCase
                )
            )
    }
}
