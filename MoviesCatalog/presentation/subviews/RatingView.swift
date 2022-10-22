//
//  RatingView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import SwiftUI

struct RatingView: View {
    var rating: Double

    @State var ratingColor: Color = .gray

    var body: some View {
        ZStack {
            Text(!rating.isNaN ? String(format: "%.1f", rating) : "-")
                .foregroundColor(ratingColor)
                .brightness(-0.3)
                .modifier(BodyModifier())
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(ratingColor)
                }
        }
        .onAppear {
            ratingColor = !rating.isNaN ? Color.getRatingColor(rating) : .gray
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 7)
    }
}
