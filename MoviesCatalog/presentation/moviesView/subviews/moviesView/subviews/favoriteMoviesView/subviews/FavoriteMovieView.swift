//
//  FavoriteMovieView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import SkeletonUI
import SwiftUI

struct FavoriteMovieView: View {
    var displayingFavoriteMovie: DisplayingFavotireMovie

    var body: some View {
        Button {
            displayingFavoriteMovie.tapClosure?()
        } label: {
            AsyncImage(url: URL(string: displayingFavoriteMovie.movie.poster)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 99, height: 144, alignment: .center)
                    .clipped()
                    .overlay {
                        VStack {
                            HStack {
                                Spacer()

                                Button {
                                    displayingFavoriteMovie.removeClosure?()
                                } label: {
                                    ZStack {
                                        Circle()
                                            .foregroundColor(Color(uiColor: R.color.shade2() ?? .gray))
                                            .frame(width: 12, height: 12)

                                        Image(systemName: "plus")
                                            .resizable()
                                            .scaledToFit()
                                            .rotationEffect(.degrees(45))
                                            .foregroundColor(Color(uiColor: R.color.shade4() ?? .gray))
                                            .frame(width: 6, height: 6)
                                    }
                                }
                                .cornerRadius(100)
                                .padding(.trailing, 3)
                                .padding(.top, 4)
                            }

                            Spacer()
                        }
                    }

            } placeholder: {
                Rectangle()
                    .skeleton(with: true)
                    .shape(type: .rectangle)
                    .frame(width: 99, height: 144)
            }
            .cornerRadius(8)
        }
    }
}

struct FavoriteMovieView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteMovieView(
            displayingFavoriteMovie: DisplayingFavotireMovie(
                movie: MockDataHelper.getMockMovie(),
                tapClosure: nil,
                removeClosure: nil
            )
        )
    }
}
