//
//  LoginView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 16.10.2022.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var viewModel: LoginViewViewModel

    @State private var displayingMode = LoginViewDisplayingModeEnum.authorization

    var body: some View {
        VStack {
            if let splashImage = R.image.splashImage() {
                Image(uiImage: splashImage)
                    .resizable()
                    .scaledToFit()
                    .padding(
                        .horizontal, displayingMode == .authorization ?
                            62 :
                            displayingMode == .registration ?
                            113 :
                            62
                    )
                    .padding(.top, 32)
            }

            switch displayingMode {
            case .authorization:
                if let authorizationView = viewModel.authorizationComponent?.authorizationView {
                    authorizationView
                        .padding(.top, 96)
                        .onAppear {
                            viewModel.authorizationComponent?
                                .authorizationViewViewModel.setRegisterClickClosure {
                                    viewModel.dispalyRegistration()
                                }
                        }
                } else {
                    Spacer()
                }
            case .registration:
                if let registrationView = viewModel.registrationComponent?.registrationView {
                    registrationView
                        .padding(.top, 24)
                        .onAppear {
                            viewModel.registrationComponent?.registrationViweViewModel
                                .setLoginClickClosure {
                                    viewModel.displayAuthorization()
                                }
                        }
                } else {
                    Spacer()
                }
            }
        }
        .background(Color(uiColor: R.color.darkAccent() ?? .black))
        .onAppear {
            displayingMode = viewModel.loginViewDisplayingMode
        }
        .onDisappear {
            viewModel.resetDisplayingData()
        }
        .onReceive(viewModel.$loginViewDisplayingMode) { value in
            withAnimation(.easeInOut(duration: 0.3)) {
                self.displayingMode = value
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(LoginViewViewModel())
    }
}
