//
//  MainView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var viewModel: MainViewViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
