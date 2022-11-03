//
//  AboutMovieView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 02.11.2022.
//

import SwiftUI

struct AboutMovieView: View {
    var detailedMovie: DetailedMovie

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(R.string.localizable.aboutFilm())
                    .modifier(BodyModifier())

                Spacer()
            }

            VStack(spacing: 4) {
                AboutMovieViewSection(
                    sectionNameText: R.string.localizable.year(),
                    sectionText: String(detailedMovie.year)
                )

                AboutMovieViewSection(
                    sectionNameText: R.string.localizable.country(),
                    sectionText: detailedMovie.country
                )

                AboutMovieViewSection(
                    sectionNameText: R.string.localizable.time(),
                    sectionText: "\(detailedMovie.time) \(R.string.localizable.min())"
                )

                AboutMovieViewSection(
                    sectionNameText: R.string.localizable.tagline(),
                    sectionText: detailedMovie.tagline
                )

                AboutMovieViewSection(
                    sectionNameText: R.string.localizable.director(),
                    sectionText: detailedMovie.director
                )

                if let budget = detailedMovie.budget {
                    AboutMovieViewSection(
                        sectionNameText: R.string.localizable.budget(),
                        sectionText: "$\(NumberFormatterHelper.formatNumberBySpaces(budget) ?? "")"
                    )
                }

                if let fees = detailedMovie.fees {
                    AboutMovieViewSection(
                        sectionNameText: R.string.localizable.worldwideFees(),
                        sectionText: "$\(NumberFormatterHelper.formatNumberBySpaces(fees) ?? "")"
                    )
                }

                AboutMovieViewSection(
                    sectionNameText: R.string.localizable.age(),
                    sectionText: "\(detailedMovie.ageLimit)+"
                )
            }
        }
    }
}

struct AboutMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMovieView(detailedMovie: MockDataHelper.getDetailedMovie())
    }
}
