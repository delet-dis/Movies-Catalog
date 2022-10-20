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

    var scaleOptions = ScaleTransformViewOptions(
        minScale: 0.60,
        maxScale: 1.00,
        scaleRatio: 0.40,
        translationRatio: .init(x: 0.61, y: 0.27),
        minTranslationRatio: .init(x: -5.00, y: -5.00),
        maxTranslationRatio: .init(x: 2.00, y: 0.00),
        keepVerticalSpacingEqual: true,
        keepHorizontalSpacingEqual: true,
        scaleCurve: .linear,
        translationCurve: .linear,
        shadowEnabled: true,
        shadowColor: .black,
        shadowOpacity: 0.60,
        shadowRadiusMin: 2.00,
        shadowRadiusMax: 13.00,
        shadowOffsetMin: .init(width: 0.00, height: 2.00),
        shadowOffsetMax: .init(width: 0.00, height: 6.00),
        shadowOpacityMin: 0.10,
        shadowOpacityMax: 0.10,
        blurEffectEnabled: false,
        blurEffectRadiusRatio: 0.40,
        blurEffectStyle: .light,
        rotation3d: nil,
        translation3d: nil
    )

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
                FavoriteMovieView(displayingFavoriteMovie: item)
            }
            .options(scaleOptions)
            .pagePadding(
                horizontal: .absolute(150)
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
