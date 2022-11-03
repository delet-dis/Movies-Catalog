//
//  UIApplicationExtensions.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 30.10.2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    var statusBarHeight: CGFloat {
        connectedScenes
            .compactMap {
                $0 as? UIWindowScene
            }
            .compactMap {
                $0.statusBarManager
            }
            .map {
                $0.statusBarFrame
            }
            .map(\.height)
            .max() ?? 0
    }
}
