//
//  DateFormatterHelper.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 02.11.2022.
//

import Foundation

class DateFormatterHelper {
    private static let isoDateFormatter = ISO8601DateFormatter()
    private static let formatter = DateFormatter()

    static func getDateFromString(_ string: String) -> String? {
        let date = isoDateFormatter.date(from: string + (string.hasSuffix("Z") ? "" : "Z"))

        guard let date = date else {
            return nil
        }

        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
}
