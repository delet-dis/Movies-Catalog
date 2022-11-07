//
//  MovieReviewDialog.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 07.11.2022.
//

import SwiftUI

struct MovieReviewDialog: View {
    private enum Field: Hashable {
        case review
    }

    @State private var currentRating = 5
    @State private var reviewText = ""
    @State private var isAnonymous = false

    @FocusState private var focusedField: Field?

    var saveReviewClosure: (ReviewRequest) -> Void
    var cancelClosure: () -> Void
    var displayingReview: DetailedReview?

    var body: some View {
        VStack {
            Spacer()

            VStack(spacing: 16) {
                HStack {
                    Text(R.string.localizable.leaveAReview())
                        .modifier(H1Modifier())

                    Spacer()
                }

                RatingStarsView(
                    maxRating: 10,
                    currentRating: $currentRating,
                    inactiveImage: Image(
                        uiImage: R.image.inactiveStar() ??
                            .strokedCheckmark
                    ),
                    activeImage: Image(
                        uiImage: R.image.activeStar() ??
                            .strokedCheckmark)
                )

                ZStack(alignment: .leading) {
                    TextEditor(text: $reviewText)
                        .scrollContentBackground(.hidden)
                        .modifier(MontserratModifier())
                        .padding(.top, 2)
                        .padding(.bottom, 2)
                        .focused($focusedField, equals: .review)
                        .foregroundColor(Color(uiColor: R.color.darkAccent() ?? .black))
                        .background(Color(uiColor: R.color.baseWhite() ?? .white))

                    Text(reviewText).opacity(0).padding(8)

                    if reviewText.isEmpty && focusedField != .review {
                        VStack {
                            HStack {
                                Text(R.string.localizable.review())
                                    .foregroundColor(.init(.systemGray2))
                                    .modifier(MontserratModifier())
                                    .padding(.vertical, 11)
                                    .padding(.leading, 8)

                                Spacer()
                            }

                            Spacer()
                        }
                        .contentShape(Rectangle())
                    }
                }
                .frame(height: 120)
                .cornerRadius(6)

                HStack {
                    Text(R.string.localizable.anonymousReview())
                        .modifier(BodyModifier())

                    Spacer()

                    CheckboxView(isActive: $isAnonymous)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        isAnonymous.toggle()
                    }
                }

                VStack(spacing: 8) {
                    Button {
                        saveReviewClosure(
                            ReviewRequest(
                                reviewText: reviewText,
                                rating: currentRating,
                                isAnonymous: isAnonymous
                            )
                        )
                    } label: {
                        Text(R.string.localizable.save())
                            .foregroundColor(Color(uiColor: R.color.baseWhite() ?? .white))
                            .modifier(BodyModifier())
                            .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .background(Color(uiColor: R.color.accent() ?? .orange))
                    .cornerRadius(4)

                    Button {
                        cancelClosure()
                    } label: {
                        Text(R.string.localizable.cancel())
                            .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))
                            .modifier(BodyModifier())
                            .padding(.vertical, 6)
                    }
                }
            }
            .padding(16)
            .background(Color(uiColor: R.color.darkGray() ?? .gray))
            .cornerRadius(16)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Button(R.string.localizable.done()) {
                            focusedField = nil
                        }
                        .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))

                        Spacer()
                    }
                }
            }

            Spacer()
        }
        .onAppear {
            currentRating = displayingReview?.rating ?? 5
            reviewText = displayingReview?.reviewText ?? ""
            isAnonymous = displayingReview?.isAnonymous ?? false
        }
        .background(.black.opacity(0.6))
    }
}

struct MovieReviewDialog_Previews: PreviewProvider {
    static var previews: some View {
        MovieReviewDialog { _ in }
        cancelClosure: {}
    }
}
