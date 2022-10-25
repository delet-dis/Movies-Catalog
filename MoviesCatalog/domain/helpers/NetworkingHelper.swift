//
//  NetworkingHelper.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

import Alamofire
import Foundation

class NetworkingHelper {
    static func getHeadersWithBearer(token: String) -> HTTPHeaders {
        var headers: HTTPHeaders = NetworkingConstants.headers
        headers.add(.authorization(bearerToken: token))

        return headers
    }
}
