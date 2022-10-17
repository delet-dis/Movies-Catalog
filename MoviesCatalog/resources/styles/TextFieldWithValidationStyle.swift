//
//  TextFieldWithValidationStyle.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import SwiftUI

struct TextFieldWithValidationStyle: TextFieldStyle {
    private var validationState: Bool
    private var isPlaceholderDispalying: Bool
    private var placeholderText: String

    init(validationState: Bool, isPlaceholderDispalying: Bool, placeholderText: String) {
        self.validationState = validationState
        self.isPlaceholderDispalying = isPlaceholderDispalying
        self.placeholderText = placeholderText
    }

    // swiftlint:disable:next identifier_name
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))
            .placeholder(when: isPlaceholderDispalying) {
                Text(placeholderText)
                    .foregroundColor(Color(uiColor: R.color.grayFaded() ?? .gray))
                    .modifier(BodySmallModifier())
            }
            .padding(.top, 13)
            .padding(.bottom, 13)
            .padding(.leading, 16)
            .overlay(RoundedRectangle(cornerRadius: 6)
                .stroke(validationState ? Color(uiColor: R.color.gray() ?? .gray) : .red))
    }
}
