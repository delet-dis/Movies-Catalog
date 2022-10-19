//
//  FavoriteMoviesView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import CollectionViewPagingLayout
import SwiftUI

struct FavoriteMoviesView: View {
    var displayingFavotireMovies: [DisplayingFavotireMovie]

    var scaleOptions: ScaleTransformViewOptions {
        .layout(.linear)
    }

    var body: some View {
        VStack {
            HStack {
                Text(R.string.localizable.favorites())
                    .modifier(H1Modifier())
                    .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))

                Spacer()
            }
            .padding(.leading, 16)

            ScalePageView(displayingFavotireMovies) { item in
                FavoriteMovieView(disaplyingFavoriteMovie: item)
            }
            .options(scaleOptions)
            .pagePadding(
                horizontal: .absolute(160)
            )
        }
        .frame(height: 212)
    }
}

struct FavoriteMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteMoviesView(
            displayingFavotireMovies: [
                DisplayingFavotireMovie(
                    movie: MockDataHelper.getMockMovie(),
                    tapClosure: nil,
                    removeClosure: nil
                )
            ].repeated(count: 5)
        )
    }
}
