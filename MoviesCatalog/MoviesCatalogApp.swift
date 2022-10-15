//
//  MoviesCatalogApp.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import SwiftUI

@main
struct MoviesCatalogApp: App {
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            MainComponent().mainView
        }
    }
}
