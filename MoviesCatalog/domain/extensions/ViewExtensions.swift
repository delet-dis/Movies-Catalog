//
//  ViewExtensions.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 16.10.2022.
//

import Foundation
import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }

    static func applyCustomPickerStyle() {
        UIDatePicker.appearance().tintColor = R.color.accent() ?? .orange
        UIDatePicker.appearance().backgroundColor = R.color.darkAccent() ?? .black

        let font = R.font.ibmPlexSansRegular(size: 14) ?? .systemFont(ofSize: 14)

        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor: R.color.grayFaded() ?? .gray, NSAttributedString.Key.font: font], for: .normal
        )

        let defaultSize = CGSize(width: 20, height: 15)

        let tintColorImage = UIImage(color: R.color.accent() ?? .orange, size: defaultSize)
        UISegmentedControl.appearance().setBackgroundImage(
            UIImage(color: .clear, size: defaultSize), for: .normal, barMetrics: .default
        )
        UISegmentedControl.appearance().setBackgroundImage(
            tintColorImage, for: .selected, barMetrics: .default
        )
        UISegmentedControl.appearance().setBackgroundImage(
            UIImage(color: (R.color.accent() ?? .orange).withAlphaComponent(0.2),
                    size: defaultSize),
            for: .highlighted, barMetrics: .default
        )
        UISegmentedControl.appearance().setBackgroundImage(
            tintColorImage, for: [.highlighted, .selected], barMetrics: .default
        )

        UISegmentedControl.appearance().setDividerImage(
            UIImage(color: R.color.gray() ?? .gray,
                    size: CGSize(width: 0.5, height: 15)),
            forLeftSegmentState: .normal,
            rightSegmentState: .normal,
            barMetrics: .default
        )
    }

    static func removeCustomPickerStyle() {
        UIDatePicker.appearance().tintColor = nil
        UIDatePicker.appearance().backgroundColor = nil

        UISegmentedControl.appearance().setBackgroundImage(
            nil,
            for: [.normal, .highlighted, .selected],
            barMetrics: .default
        )
        UISegmentedControl.appearance().setDividerImage(
            nil,
            forLeftSegmentState: .normal,
            rightSegmentState: .normal,
            barMetrics: .default
        )
    }
}
