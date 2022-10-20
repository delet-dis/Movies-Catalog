//
//  RatingView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import SwiftUI

struct RatingView: View {
    var rating: Double

    var body: some View {
        ZStack {
            Text(String(rating))
                .modifier(BodyModifier())
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.getRatingColor(rating))
                }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 7)
    }
}
