//
//  AboutMovieView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 02.11.2022.
//

import SwiftUI

struct AboutMovieView: View {
    var displayingMovie: DetailedMovie

    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "
        return numberFormatter
    }()

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
                    sectionText: String(displayingMovie.year)
                )

                AboutMovieViewSection(
                    sectionNameText: R.string.localizable.country(),
                    sectionText: displayingMovie.country
                )

                AboutMovieViewSection(
                    sectionNameText: R.string.localizable.time(),
                    sectionText: "\(displayingMovie.time) \(R.string.localizable.min())"
                )

                AboutMovieViewSection(
                    sectionNameText: R.string.localizable.tagline(),
                    sectionText: displayingMovie.tagline
                )

                AboutMovieViewSection(
                    sectionNameText: R.string.localizable.director(),
                    sectionText: displayingMovie.director
                )

                AboutMovieViewSection(
                    sectionNameText: R.string.localizable.budget(),
                    sectionText: "$\(numberFormatter.string(from: displayingMovie.budget as NSNumber) ?? "")"
                )

                AboutMovieViewSection(
                    sectionNameText: R.string.localizable.worldwideFees(),
                    sectionText: "$\(numberFormatter.string(from: displayingMovie.fees as NSNumber) ?? "")"
                )

                AboutMovieViewSection(
                    sectionNameText: R.string.localizable.age(),
                    sectionText: "\(displayingMovie.ageLimit)+"
                )
            }
        }
    }
}

struct AboutMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMovieView(displayingMovie: MockDataHelper.getDetailedMovie())
    }
}
