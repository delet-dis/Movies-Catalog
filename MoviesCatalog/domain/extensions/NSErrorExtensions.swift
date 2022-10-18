//
//  NSErrorExtensions.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 18.10.2022.
//

import Foundation

extension NSError{
    static func createErrorWithLocalizedDescription(_ text: String) -> NSError{
        NSError(domain: Bundle.main.bundleIdentifier ?? "com.delet-dis.MoviesCatalog",
                code: 0,
                userInfo: [NSLocalizedDescriptionKey: text])
    }
}
