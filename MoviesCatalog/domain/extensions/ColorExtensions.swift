//
//  ColorExtensions.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import Foundation
import SwiftUI

extension Color {
    static func getRatingColor(_ rating: Double) -> Color {
        let rating = rating / 10

        return Color(red: 1 - rating, green: rating, blue: 0)
    }
}
