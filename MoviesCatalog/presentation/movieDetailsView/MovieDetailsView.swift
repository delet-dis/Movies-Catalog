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

    private static let headerImageHeight: CGFloat = 250
    private static let navigationBarHeight: CGFloat = 56

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                GeometryReader { geometry -> AnyView in
                    if (geometry.frame(in: .global).minY + 250) < 0 {
                        DispatchQueue.main.async {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isCollapsedHeaderShowing = true
                            }
                        }

                    } else {
                        DispatchQueue.main.async {
                            withAnimation(.easeInOut(duration: 0.3)) {
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
                                    .frame(height: Self.headerImageHeight, alignment: .center)
                                    .clipped()
                            } placeholder: {
                                Rectangle()
                                    .skeleton(with: true)
                                    .shape(type: .rectangle)
                                    .frame(height: Self.headerImageHeight, alignment: .center)
                            }
                            .clipShape(Rectangle())
                            .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                            .offset(y: geometry.frame(in: .global).minY / 5)
                        )
                    } else {
                        return AnyView(
                            Rectangle()
                                .frame(height: Self.headerImageHeight)
                                .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                                .offset(y: geometry.frame(in: .global).minY / 5)
                        )
                    }
                }
                .frame(height: Self.headerImageHeight)
                .aspectRatio(contentMode: .fit)
                .overlay {
                    VStack {
                        Spacer()

                        HStack {
                            Text(viewModel.displayingDetailedMovie?.name)
                                .modifier(TitleModifier())
                                .multilineTextAlignment(.leading)

                            Spacer()
                        }
                    }
                    .padding(.bottom, 16)
                    .padding(.leading, 16)
                }

                VStack {
                    Text(viewModel.displayingDetailedMovie?.description)
                        .modifier(BodySmallModifier())
                        .multilineTextAlignment(.leading)

                    Spacer()
                        .frame(height: 1000)
                }
                .padding(.horizontal, 16)
            }

            VStack {
                VStack {
                    Spacer()

                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(uiImage: R.image.chevronLeft() ?? .strokedCheckmark)
                                .foregroundColor(Color(uiColor: R.color.baseWhite() ?? .white))
                        }

                        Spacer()

                        Text(viewModel.displayingDetailedMovie?.name)
                            .modifier(H1Modifier())

                        Spacer()

                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 21, height: 19)
                            .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))
                    }
                    .frame(height: Self.navigationBarHeight)
                    .padding(.horizontal, 16)
                }
                .frame(height: Self.navigationBarHeight + UIApplication.shared.statusBarHeight)
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
