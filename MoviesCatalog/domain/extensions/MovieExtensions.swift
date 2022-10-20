//
//  MovieExtensions.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import Accelerate
import Foundation
import SwiftUI

extension Movie {
    func calculateRating() -> Double {
        var arrayOfReviewsMarks: [Double] = []

        reviews?.forEach { review in
            arrayOfReviewsMarks.append(Double(review.rating))
        }

        return vDSP.mean(arrayOfReviewsMarks)
    }
}
