//
//  MainView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var viewModel: MainViewViewModel

    @State private var displayingMode = MainViewDisaplyingMode.authorization
    @State private var isSplashDisplaying = true

    var body: some View {
        ZStack {
            switch displayingMode {
            case .authorization:
                viewModel.authorizationComponent?.authorizationView
            case .homeScreen:
                Text("Home")
            }

            SplashView()
                .opacity(isSplashDisplaying ? 1 : 0)
        }
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
    static var previews: some View {
        MainView()
            .environmentObject(MainViewViewModel())
    }
}
