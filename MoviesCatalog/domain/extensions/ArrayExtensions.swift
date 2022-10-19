//
//  ArrayExtensions.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import Foundation

extension Array {
    func repeated(count: Int) -> [Element] {
        var result = self
        for _ in 0 ..< count - 1 {
            result += self
        }

        return result
    }
}
