//
//  AboutMovieViewSection.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 02.11.2022.
//

import SwiftUI

struct AboutMovieViewSection: View {
    var sectionNameText: String
    var sectionText: String

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            VStack(alignment: .leading) {
                Text(sectionNameText)
                    .frame(width: 100, alignment: .leading)
                    .modifier(MontserratModifier())
                    .foregroundColor(Color(uiColor: R.color.gray() ?? .gray))
            }

            VStack {
                Text(sectionText)
                    .multilineTextAlignment(.leading)
                    .modifier(MontserratModifier())
                    .foregroundColor(Color(uiColor: R.color.baseWhite() ?? .white))
            }

            Spacer()
        }
    }
}

struct AboutMovieViewSection_Previews: PreviewProvider {
    static var previews: some View {
        AboutMovieViewSection(sectionNameText: "Год", sectionText: "1994")
    }
}
