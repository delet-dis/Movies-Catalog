//
//  AuthorizationView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import SwiftUI

struct AuthorizationView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Test")
        }
        .background(Color(uiColor: R.color.darkAccent() ?? .black))
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
