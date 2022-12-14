//
//  HomeComponent.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import Foundation
import NeedleFoundation
import SwiftUI

protocol HomeComponentDependency: Dependency {}

final class HomeComponent: Component<HomeComponentDependency> {
    var moviesComponent: MoviesComponent {
        shared {
            MoviesComponent(parent: self)
        }
    }

    var profileComponent: ProfileComponent {
        shared {
            ProfileComponent(parent: self)
        }
    }

    var homeViewViewModel: HomeViewViewModel {
        shared {
            HomeViewViewModel(
                moviesComponent: moviesComponent,
                profileComponent: profileComponent
            )
        }
    }

    var homeView: some View {
        shared {
            HomeView()
                .environmentObject(homeViewViewModel)
        }
    }
}
