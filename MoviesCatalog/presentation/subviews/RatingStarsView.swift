//
//  RatingStarsView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 07.11.2022.
//

import SwiftUI

struct RatingStarsView: View {
    var maxRating: Int
    @Binding var currentRating: Int
    var color: UIColor
    var inactiveImage: Image
    var activeImage: Image

    public init(
        maxRating: Int,
        currentRating: Binding<Int>,
        color: UIColor = UIColor.systemYellow,
        inactiveImage: Image = Image(systemName: "star"),
        activeImage: Image = Image(systemName: "star.fill")
    ) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.color = color
        self.inactiveImage = inactiveImage
        self.activeImage = activeImage
    }

    public var body: some View {
        HStack {
            ForEach(0 ..< maxRating, id: \.self) { rating in
                Spacer()
                
                if rating < self.currentRating {
                    activeImage
                        .foregroundColor(Color(self.color))
                        .onTapGesture {
                            self.currentRating = rating + 1
                        }
                        .frame(width: 24, height: 24)
                } else {
                    inactiveImage
                        .foregroundColor(Color(self.color))
                        .onTapGesture {
                            self.currentRating = rating + 1
                        }
                        .frame(width: 24, height: 24)
                }

                Spacer()
            }
        }
    }
}

struct RatingStarsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingStarsView(maxRating: 5, currentRating: .constant(3))
            .environment(\.colorScheme, .light)
            .previewLayout(.sizeThatFits)
            .padding(10)
    }
}
