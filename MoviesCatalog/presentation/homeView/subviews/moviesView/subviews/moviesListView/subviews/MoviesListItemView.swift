//
//  MoviesListItemView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 20.10.2022.
//

import SwiftUI

struct MoviesListItemView: View {
    var displayingMovie: DisplayingMovie

    var body: some View {
        Button {
            displayingMovie.tapClosure?()
        } label: {
            HStack {
                AsyncImage(url: URL(string: displayingMovie.movie.poster)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 144, alignment: .center)
                        .clipped()
                } placeholder: {
                    Rectangle()
                        .skeleton(with: true)
                        .shape(type: .rectangle)
                        .frame(width:100, height: 144)
                }
                .cornerRadius(8)

                VStack {
                    VStack(spacing: 4) {
                        HStack {
                            Text(displayingMovie.movie.name)
                                .modifier(H2Modifier())
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.leading)

                            Spacer()
                        }

                        HStack {
                            Text("\(String(displayingMovie.movie.year)) • \(displayingMovie.movie.country)")

                            Spacer()
                        }

                        FlexboxView(alignment: .topLeading, items: displayingMovie.movie.genres) { position in
                            // swiftlint:disable:next line_length
                            Text("\(displayingMovie.movie.genres[position].name)\(position != displayingMovie.movie.genres.count - 1 ? ", " : "")")
                        }
                    }

                    HStack {
                        RatingView(rating: displayingMovie.movie.calculateRating())

                        Spacer()
                    }
                }

                Spacer()
            }
            .frame(height: 144)
            .foregroundColor(.white)
        }
    }
}

struct MoviesListItemView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListItemView(
            displayingMovie: DisplayingMovie(movie: MockDataHelper.getMovie(), tapClosure: nil)
        )
    }
}
