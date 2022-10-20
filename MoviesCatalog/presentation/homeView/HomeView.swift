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
        switch viewDisplayingMode {
        case .movies:
            viewModel.moviesComponent?.moviesView
        case .profile:
            EmptyView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewViewModel())
    }
}
