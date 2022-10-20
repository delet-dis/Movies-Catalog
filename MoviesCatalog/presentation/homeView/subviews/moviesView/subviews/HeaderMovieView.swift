//
//  HeaderMovieView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import SwiftUI

struct HeaderMovieView: View {
    var displayingMovie: DisplayingMovie?

    var body: some View {
        if let posterUrl = displayingMovie?.movie.poster {
            AsyncImage(url: URL(string: posterUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400, alignment: .center)
                    .clipped()
                    .mask(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    Color(uiColor: R.color.darkAccent() ?? .black),
                                    Color(uiColor: R.color.darkAccent() ?? .black),
                                    .clear
                                ]
                            ), startPoint: .top, endPoint: .bottom
                        )
                    )
                    .overlay {
                        VStack {
                            Spacer()

                            Button {
                                displayingMovie?.tapClosure?()
                            } label: {
                                Text(R.string.localizable.watch())
                                    .foregroundColor(.white)
                                    .modifier(BodyModifier())
                                    .frame(maxWidth: .infinity)
                            }
                            .padding()
                            .background(Color(uiColor: R.color.accent() ?? .orange))
                            .cornerRadius(4)
                            .frame(width: 160, height: 44)
                            .padding(.bottom, 63)
                        }
                    }

            } placeholder: {
                Rectangle()
                    .skeleton(with: true)
                    .shape(type: .rectangle)
                    .frame(height: 400)
            }
            .ignoresSafeArea()
        }
    }
}

struct HeaderVideoView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMovieView(
            displayingMovie: DisplayingMovie(movie: MockDataHelper.getMockMovie(), tapClosure: nil)
        )
    }
}
