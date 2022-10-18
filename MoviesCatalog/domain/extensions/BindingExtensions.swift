//
//  BindingExtensions.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 17.10.2022.
//

import Foundation
import SwiftUI

public extension Binding where Value: Equatable {
    init(_ source: Binding<Value>, deselectTo value: Value) {
        self.init(get: { source.wrappedValue },
                  set: { source.wrappedValue = $0 == source.wrappedValue ? value : $0 }
        )
    }
}
