//
//  DispatchQueueExtensions.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 02.11.2022.
//

import Foundation

extension DispatchQueue {
    enum DispatchQueueDelay: Double {
        case short = 0.01
        case normal = 0.5
    }

    static func runAsyncOnMain(
        delay: DispatchQueueDelay = .normal,
        _ closure: @escaping @convention(block) () -> Void
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay.rawValue) {
            closure()
        }
    }
}
