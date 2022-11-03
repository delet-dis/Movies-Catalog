//
//  MovieReviewsView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 02.11.2022.
//

import SwiftUI

struct MovieReviewsView: View {
    var reviewAddClosure: (() -> Void)?
    var displayingDetailedReviews: [DisplayingDetailedReview]

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(R.string.localizable.reviews())
                    .modifier(BodyModifier())

                Spacer()

                if let reviewAddClosure = reviewAddClosure {
                    Button {
                        reviewAddClosure()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))
                    }
                }
            }

            VStack {
                ForEach(displayingDetailedReviews) { review in
                    MovieReview(displayingDetailedReview: review)
                }
            }
        }
    }
}

struct MovieReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieReviewsView(
            reviewAddClosure: {},
            displayingDetailedReviews: [MockDataHelper.getDisplayingDetailedReview()]
        )
    }
}
