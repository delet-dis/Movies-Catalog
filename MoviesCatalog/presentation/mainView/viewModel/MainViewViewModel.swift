//
//  MainViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation

class MainViewViewModel: ObservableObject {
    @Published private(set) var mainViewDispalyingMode: MainViewDisaplyingMode = .splash

    init() {}

    func executeSplashCountdown() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            mainViewDispalyingMode = .authorization
        }
    }

    func observeAuthStatus(){
        
    }
}
