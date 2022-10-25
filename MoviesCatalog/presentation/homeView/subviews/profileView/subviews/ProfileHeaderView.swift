//
//  ProfileHeaderView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

import SwiftUI

struct ProfileHeaderView: View {
    var profile: Profile

    var body: some View {
        HStack(spacing: 16) {
            if let avatarLink = profile.avatarLink {
                AsyncImage(url: URL(string: avatarLink)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 88, height: 88, alignment: .center)
                        .clipped()
                } placeholder: {
                    Circle()
                        .skeleton(with: true)
                        .shape(type: .circle)
                        .frame(width: 88, height: 88)
                }
                .clipShape(Circle())
            } else {
                ZStack {
                    Image(uiImage: R.image.defaultAvatarIcon() ?? .strokedCheckmark)
                        .resizable()
                        .frame(width: 88, height: 88)
                }
            }

            Text(profile.nickName ?? R.string.localizable.noNickname())
                .font(Font(UIFont.systemFont(ofSize: 24, weight: .bold)))
                .bold()
                .foregroundColor(.white)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(profile: MockDataHelper.getProfile())
    }
}
