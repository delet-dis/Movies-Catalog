//
//  AppConstants.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation
import Alamofire

class NetworkingConstants {
    static let baseUrl = "https://react-midterm.kreosoft.space"

    static let headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]

    static let unauthorizedStatusCode = 401
    static let successStatusCode = 200

    static let timeout = TimeInterval(10)
}
