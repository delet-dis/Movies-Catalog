//
//  MovieDetailsView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 28.10.2022.
//

import SwiftUI

struct MovieDetailsView: View {
    @EnvironmentObject private var viewModel: MovieDetailsViewViewModel

    @Environment(\.dismiss) private var dismiss

    @State private var isCollapsedHeaderShowing = false

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                GeometryReader { geometry -> AnyView in
                    if (geometry.frame(in: .global).minY + 250) < 0 {
                        DispatchQueue.main.async {
                            withAnimation {
                                isCollapsedHeaderShowing = true
                            }
                        }

                    } else {
                        DispatchQueue.main.async {
                            withAnimation {
                                isCollapsedHeaderShowing = false
                            }
                        }
                    }

                    if let posterUrl = viewModel.displayingDetailedMovie?.poster {
                        return AnyView(
                            AsyncImage(url: URL(string: posterUrl)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 250, alignment: .center)
                                    .clipped()
                            } placeholder: {
                                Rectangle()
                                    .skeleton(with: true)
                                    .shape(type: .rectangle)
                                    .frame(height: 250, alignment: .center)
                            }
                            .clipShape(Rectangle())
                            .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                            .offset(y: geometry.frame(in: .global).minY / 5)
                        )
                    } else {
                        return AnyView(
                            Rectangle()
                                .frame(height: 250)
                                .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                                .offset(y: geometry.frame(in: .global).minY / 5)
                        )
                    }
                }
                .frame(height: 250)
                .aspectRatio(contentMode: .fit)

                VStack {
                    Text("Test")

                    Spacer()
                        .frame(height: 1000)
                }
            }

            VStack {
                HStack {
                    Spacer()

                    Text("text")
                }
                .frame(height: 56)
                .background(Color(uiColor: R.color.darkAccent() ?? .black))

                Spacer()
            }
            .opacity(isCollapsedHeaderShowing ? 1 : 0)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .background(Color(uiColor: R.color.darkAccent() ?? .black))
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    private static let moviesRepository = MoviesRepositoryImpl(
        jsonDecoder: JSONDecoder(), jsonEncoder: JSONEncoder()
    )
    private static let loadMovieDetailsUseCase = LoadMovieDetailsUseCase(moviesRepository: moviesRepository)

    static var previews: some View {
        MovieDetailsView()
            .environmentObject(
                MovieDetailsViewViewModel(
                    loadMovieDetailsUseCase: loadMovieDetailsUseCase
                )
            )
    }
}
