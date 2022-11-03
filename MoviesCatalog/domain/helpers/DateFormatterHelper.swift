//
//  DateFormatterHelper.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 02.11.2022.
//

import Foundation

class DateFormatterHelper {
    private static let iso8601withFractionalSeconds: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()

    private static let formatter = DateFormatter()

    static func getDateFromString(_ string: String) -> String? {
        let date = iso8601withFractionalSeconds.date(from: string + (string.hasSuffix("Z") ? "" : "Z"))

        guard let date = date else {
            return nil
        }

        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
}
