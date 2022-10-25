//
//  HomeView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var viewModel: HomeViewViewModel

    @State private var viewDisplayingMode: HomeViewDisplayingModeEnum = .movies

    var body: some View {
        TabView(selection: $viewDisplayingMode) {
            if let moviesView = viewModel.moviesComponent?.moviesView {
                moviesView
                    .tabItem {
                        Label {
                            Text(R.string.localizable.moviesScreenTabDescription())
                                .modifier(FootnoteModifier())
                        } icon: {
                            Image(uiImage: R.image.tvIcon() ?? .strokedCheckmark)
                        }
                    }
            }

            if let profileView = viewModel.profileComponent?.profileView {
                profileView
                    .tabItem {
                        Label {
                            Text(R.string.localizable.moviesScreenTabDescription())
                                .modifier(FootnoteModifier())
                        } icon: {
                            Image(uiImage: R.image.personIcon() ?? .strokedCheckmark)
                        }
                    }
            }
        }
        .onAppear {
            setAppearance()
        }
        .onDisappear {
            removeAppearance()
        }
        .accentColor(Color(uiColor: R.color.accent() ?? .orange))
    }

    private func setAppearance() {
        UITabBar.appearance().unselectedItemTintColor = R.color.gray()
    }

    private func removeAppearance() {
        UITabBar.appearance().unselectedItemTintColor = nil
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewViewModel())
    }
}
