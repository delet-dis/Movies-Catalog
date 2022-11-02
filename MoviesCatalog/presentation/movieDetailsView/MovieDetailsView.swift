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
    @State private var isFavorite = false
    @State private var isAbleToShowNavigationBar = false

    private static let headerImageHeight: CGFloat = 250
    private static let navigationBarHeight: CGFloat = 56

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                GeometryReader { geometry -> AnyView in
                    if (geometry.frame(in: .global).minY + Self.headerImageHeight) < 0 {
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
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(uiImage: R.image.chevronLeft() ?? .strokedCheckmark)
                                    .foregroundColor(Color(uiColor: R.color.baseWhite() ?? .white))
                            }
                            .padding(
                                .top,
                                Self.navigationBarHeight / 2 + UIApplication.shared.statusBarHeight
                            )

                            Spacer()
                        }

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

                VStack(spacing: 16) {
                    HStack {
                        Text(viewModel.displayingDetailedMovie?.description)
                            .modifier(BodySmallModifier())
                            .multilineTextAlignment(.leading)

                        Spacer()
                    }

                    if let displayingDetailedMovie = viewModel.displayingDetailedMovie {
                        AboutMovieView(detailedMovie: displayingDetailedMovie)

                        MovieGenresView(genres: displayingDetailedMovie.genres)

//                        MovieReviewsView(reviewAddClosure: {}, displayingDetailedReviews: displayingDetailedMovie.reviews)
                    }
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

                        Button {
                            viewModel.toggleFavoriteState()
                        } label: {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .resizable()
                                .frame(width: 21, height: 19)
                                .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))
                        }
                    }
                    .frame(height: Self.navigationBarHeight)
                    .padding(.horizontal, 16)
                }
                .frame(height: Self.navigationBarHeight + UIApplication.shared.statusBarHeight)
                .background(Color(uiColor: R.color.darkAccent() ?? .black))

                Spacer()
            }
            .opacity(isCollapsedHeaderShowing && isAbleToShowNavigationBar ? 1 : 0)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .background(Color(uiColor: R.color.darkAccent() ?? .black))
        .onAppear {
            isFavorite = isFavorite
        }
        .onReceive(viewModel.$isFavorite) { value in
            withAnimation {
                self.isFavorite = value
            }
        }
        .onAppear {
            isAbleToShowNavigationBar = false

            DispatchQueue.runAsyncOnMain(delay: .normal) {
                isAbleToShowNavigationBar = true
            }
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    private static let moviesRepository = MoviesRepositoryImpl(
        jsonDecoder: JSONDecoder(), jsonEncoder: JSONEncoder()
    )
    private static let loadMovieDetailsUseCase = LoadMovieDetailsUseCase(moviesRepository: moviesRepository)

    private static let authRepository = AuthRepositoryImpl(
        jsonDecoder: JSONDecoder(),
        jsonEncoder: JSONEncoder()
    )
    private static let keychainRepository = KeychainRepositoryImpl()
    private static let saveTokenUseCase = SaveTokenUseCase(keychainRepository: keychainRepository)
    private static let getTokenUseCase = GetTokenUseCase(keychainRepository: keychainRepository)

    private static let saveAuthStatusUseCase = SaveAuthStatusUseCase()
    private static let logoutUseCase = LogoutUseCase(
        authRepository: authRepository,
        saveAuthStatusUseCase: saveAuthStatusUseCase,
        saveTokenUseCase: saveTokenUseCase
    )

    private static let favoritesRepository = FavoritesRepositoryImpl(
        jsonDecoder: JSONDecoder(),
        jsonEncoder: JSONEncoder(),
        logoutUseCase: logoutUseCase
    )
    private static let toggleFavoriteStatusUseCase = ToggleFavoriteStatusUseCase(
        favoritesRepository: favoritesRepository
    )
    private static let getFavoriteStatusUseCase = GetFavoriteStatusUseCase(
        favoritesRepository: favoritesRepository
    )

    static var previews: some View {
        MovieDetailsView()
            .environmentObject(
                MovieDetailsViewViewModel(
                    loadMovieDetailsUseCase: loadMovieDetailsUseCase,
                    getFavoriteStatusUseCase: getFavoriteStatusUseCase,
                    toggleFavoriteStatusUseCase: toggleFavoriteStatusUseCase,
                    getTokenUseCase: getTokenUseCase
                )
            )
    }
}
