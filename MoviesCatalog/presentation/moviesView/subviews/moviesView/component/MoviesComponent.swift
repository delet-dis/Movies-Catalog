//
//  MoviesComponent.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import Foundation
import NeedleFoundation
import SwiftUI

protocol MoviesComponentDependency: Dependency {}

final class MoviesComponent: Component<MoviesComponentDependency> {
    var moviesViewViewModel: MoviesViewViewModel {
        shared {
            MoviesViewViewModel(
            )
        }
    }

    var moviesView: some View {
        shared {
            MoviesView()
                .environmentObject(moviesViewViewModel)
        }
    }
}
