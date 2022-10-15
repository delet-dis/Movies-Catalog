//
//  KeychainRepository.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation

protocol KeychainRepository {
    func getValueByKey(_ key: String, completion: ((Result<String, Error>) -> Void)?)
    func saveValueByKey(_ key: String, value: String, completion: ((Result<Void, Error>) -> Void)?)
}
