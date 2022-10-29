//
//  UINavigationComntrollerExtensions.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 29.10.2022.
//

import Foundation
import UIKit

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
