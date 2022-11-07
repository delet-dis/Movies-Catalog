//
//  CheckboxView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 07.11.2022.
//

import SwiftUI

struct CheckboxView: View {
    @Binding var isActive: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color(uiColor: R.color.baseWhite() ?? .white))
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(.clear)

            Image(systemName: "checkmark")
                .resizable()
                .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))
                .frame(width: 25, height: 20, alignment: .center)
                .opacity(isActive ? 1 : 0)
                .background(.clear)
        }
        .background(.clear)
        .onTapGesture {
            withAnimation {
                isActive.toggle()
            }
        }
    }
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView(isActive: .constant(true))
    }
}
