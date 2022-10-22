//
//  AppConstants.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation
import Alamofire

class AppConstants {
    static let baseUrl = "https://react-midterm.kreosoft.space"

    static let networkingHeaders: HTTPHeaders = [
        "Content-Type": "application/json"
    ]

    static let unauthorizedStatusCode = 401
}
