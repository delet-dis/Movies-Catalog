//
//  NumberFormatterHelper.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 02.11.2022.
//

import Foundation

class NumberFormatterHelper {
    private static let numberFormatter = NumberFormatter()

    static func formatNumberBySpaces(_ number: Int) -> String? {
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "

        return numberFormatter.string(from: number as NSNumber)
    }
}
