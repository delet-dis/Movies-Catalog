//
//  MovieDetailsView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 28.10.2022.
//

import SwiftUI

struct MovieDetailsView: View {
    @EnvironmentObject private var viewModel: MovieDetailsViewViewModel

    var body: some View {
        ScrollView {
            HStack {
                Spacer()

                VStack {
                    Spacer()
                        .frame(height: 1000)

                    Text("Test")
                }
            }
        }
        .onAppear {
            setNavigationBarBackgroundImage()
        }
        .onDisappear {
            removeNavigationBarBackgroundImage()
        }
        .navigationTitle(viewModel.displayingDetailedMovie?.name ?? "Test title")
        .navigationBarTitleDisplayMode(.large)
    }

    func setNavigationBarBackgroundImage() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        appearance.backgroundImage = R.image.splashImage() ?? .checkmark

        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    func removeNavigationBarBackgroundImage() {}
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
