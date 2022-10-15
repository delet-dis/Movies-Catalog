//
//  SplashView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Spacer()

            if let splashImage = R.image.splashImage() {
                Image(uiImage: splashImage)
                    .resizable()
                    .scaledToFit()
                    .padding(35)
            }

            Spacer()
        }
        .background(Color(uiColor: R.color.darkAccent() ?? .black))
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
