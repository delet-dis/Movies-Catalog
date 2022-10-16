//
//  TextFieldWithValidationStyle.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import SwiftUI

struct TextFieldWithValidationStyle: TextFieldStyle {
    private var validationState: Bool

    init(validationState: Bool) {
        self.validationState = validationState
    }

    // swiftlint:disable:next identifier_name
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .foregroundColor(Color(uiColor: R.color.grayFaded() ?? .gray))
            .padding(.top, 13)
            .padding(.bottom, 13)
            .padding(.leading, 16)
            .overlay(RoundedRectangle(cornerRadius: 6)
                .stroke(validationState ? Color(uiColor: R.color.gray() ?? .gray) : .red))
    }
}
