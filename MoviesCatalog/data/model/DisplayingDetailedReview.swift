//
//  DisplayingDetailedReview.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 02.11.2022.
//

import Foundation

struct DisplayingDetailedReview: Identifiable {
    let id = UUID().uuidString
    let detailedReview: DetailedReview
    let isUserReview: Bool
    let editClosure: ((String) -> Void)?
    let removeClosure: ((String) -> Void)?
}
