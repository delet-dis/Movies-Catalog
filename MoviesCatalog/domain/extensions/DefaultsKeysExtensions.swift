//
//  DefaultsKeysExtensions.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    var isAuthorized: DefaultsKey<Bool?> { .init("isAuthorized", defaultValue: false) }
}
