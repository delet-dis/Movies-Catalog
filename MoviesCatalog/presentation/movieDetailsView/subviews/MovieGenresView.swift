//
//  MovieGenresView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 02.11.2022.
//

import SwiftUI

struct MovieGenresView: View {
    var genres: [Genre]

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(R.string.localizable.genres())
                    .modifier(BodyModifier())

                Spacer()
            }

            FlexboxView(alignment: .leading, spacing: 8, items: genres) { position in
                Text(genres[position].name)
                    .modifier(MontserratModifier())
                    .padding(.vertical, 6)
                    .padding(.horizontal, 16)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))
                    }
            }
        }
    }
}

struct MovieGenresView_Previews: PreviewProvider {
    static var previews: some View {
        MovieGenresView(genres: MockDataHelper.getDetailedMovie().genres)
    }
}
