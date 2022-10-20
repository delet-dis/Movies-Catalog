//
//  MoviesListView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 20.10.2022.
//

import SwiftUI

struct MoviesListView: View {
    var displayingMovies: [DisplayingMovie]
    var requestNewMoviesClosure: (() -> Void)?

    var body: some View {
        VStack {
            HStack {
                Text(R.string.localizable.gallery())
                    .modifier(H1Modifier())
                    .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))

                Spacer()
            }
            .padding(.bottom, 8)

            LazyVStack(spacing: 16) {
                ForEach(Array(displayingMovies.enumerated()), id: \.element.id) { index, movie in
                    MoviesListItemView(displayingMovie: movie)
                        .onAppear {
                            if index == displayingMovies.count - 1 {
                                requestNewMoviesClosure?()
                            }
                        }
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView(
            displayingMovies: [
                DisplayingMovie(movie: MockDataHelper.getMockMovie(), tapClosure: nil),
                DisplayingMovie(movie: MockDataHelper.getMockMovie(), tapClosure: nil)
            ])
    }
}
