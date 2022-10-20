//
//  MoviesView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import SwiftUI

struct MoviesView: View {
    @EnvironmentObject private var viewModel: MoviesViewViewModel

    var body: some View {
        ScrollView {
            VStack {
                HeaderMovieView(displayingMovie: viewModel.displayingHeaderMovie)

                if !viewModel.displayingFavoriteMovies.isEmpty {
                    FavoriteMoviesView(displayingFavotireMovies: viewModel.displayingFavoriteMovies)
                }

                MoviesListView(displayingMovies: viewModel.displayingMovies)

                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
            .environmentObject(MoviesViewViewModel())
    }
}
