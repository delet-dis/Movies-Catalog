//
//  MovieReview.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 02.11.2022.
//

import SwiftUI

struct MovieReview: View {
    var displayingDetailedReview: DisplayingDetailedReview

    private static let avatarSize: CGFloat = 40
    private static let circleButtonsSize: CGFloat = 24

    var body: some View {
        VStack {
            HStack(spacing: 8) {
                if !displayingDetailedReview.detailedReview.isAnonymous,
                   let avatarLink = displayingDetailedReview.detailedReview.author?.avatar,
                   !avatarLink.isEmpty && isAvatarLinkValid(avatarLink) {
                    AsyncImage(url: URL(string: avatarLink)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: Self.avatarSize, height: Self.avatarSize, alignment: .center)
                            .clipped()
                    } placeholder: {
                        Circle()
                            .skeleton(with: true)
                            .shape(type: .circle)
                            .frame(width: Self.avatarSize, height: Self.avatarSize)
                    }
                    .clipShape(Circle())
                } else {
                    Image(uiImage: R.image.defaultAvatarIcon() ?? .strokedCheckmark)
                        .resizable()
                        .frame(width: Self.avatarSize, height: Self.avatarSize)
                }

                VStack(alignment: .leading, spacing: 0) {
                    Text(
                        displayingDetailedReview.detailedReview.isAnonymous ?
                            R.string.localizable.anonymousUser() :
                            displayingDetailedReview.detailedReview.author?.nickName
                    )
                    .font(Font(UIFont.systemFont(ofSize: 24, weight: .bold)))
                    .bold()
                    .foregroundColor(.white)

                    if displayingDetailedReview.isUserReview {
                        Text(R.string.localizable.myReview())
                            .modifier(PlexSansSmallModifier())
                            .foregroundColor(Color(uiColor: R.color.gray() ?? .gray))
                    }
                }

                Spacer()

                RatingView(rating: Double(displayingDetailedReview.detailedReview.rating), isDecimal: false)
            }

            HStack {
                Text(displayingDetailedReview.detailedReview.reviewText)
                    .multilineTextAlignment(.leading)
                    .modifier(BodyModifier())

                Spacer()
            }
            .padding(.bottom, 4)

            HStack(spacing: 8) {
                HStack {
                    Text(
                        DateFormatterHelper.getDateFromString(
                            displayingDetailedReview.detailedReview.createDateTime
                        )
                    )
                    .modifier(PlexSansSmallModifier())
                    .foregroundColor(Color(uiColor: R.color.gray() ?? .gray))

                    Spacer()
                }

                if let editClosure = displayingDetailedReview.editClosure,
                   let removeClosure = displayingDetailedReview.removeClosure {
                    HStack(spacing: 8) {
                        Button {
                            editClosure()
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(width: Self.circleButtonsSize, height: Self.circleButtonsSize)
                                    .foregroundColor(Color(uiColor: R.color.gray() ?? .gray).opacity(0.25))

                                Image(systemName: "pencil")
                                    .foregroundColor(Color(uiColor: R.color.grayFaded() ?? .gray))
                            }
                        }

                        Button {
                            removeClosure()
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(width: Self.circleButtonsSize, height: Self.circleButtonsSize)
                                    .foregroundColor(
                                        Color(uiColor: R.color.accent() ?? .orange).opacity(0.25)
                                    )

                                Image(systemName: "plus")
                                    .rotationEffect(.degrees(45))
                                    .foregroundColor(Color(uiColor: R.color.grayFaded() ?? .gray))
                            }
                        }
                    }
                }
            }
        }
        .padding(.all, 8)
        .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Color(uiColor: R.color.grayFaded() ?? .gray)))
    }

    private func isAvatarLinkValid(_ avatarLink: String) -> Bool {
        AuthenticationDataValidatorHelper.isAvatarURLValid(avatarLink)
    }
}

struct MovieReview_Previews: PreviewProvider {
    static var previews: some View {
        MovieReview(displayingDetailedReview: MockDataHelper.getDisplayingDetailedReview())
    }
}
