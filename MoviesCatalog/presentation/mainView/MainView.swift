//
//  MainView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var viewModel: MainViewViewModel

    @State private var displayingMode = MainViewDisaplyingMode.splash

    var body: some View {
        HStack {
            switch displayingMode {
            case .authorization:
                Text("Auth")
            case .homeScreen:
                Text("Home")
            case .splash:
                SplashView()
            }
        }.onAppear {
            displayingMode = viewModel.mainViewDispalyingMode

            viewModel.executeSplashCountdown()
        }
        .onReceive(viewModel.$mainViewDispalyingMode) { value in
            withAnimation(.easeInOut(duration: 0.5)) {
                self.displayingMode = value
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
