//
//  Product.swift
//  CodeReviwerTest
//
//  Created by Tharik anver  on 11/08/26.
//

import Foundation

struct Product: Identifiable {
    let id: Int
    let name: String
    let price: Double
    let imageURL: String?

    var formattedPrice: String {
        return "$\(price)"
    }

    func discountedPrice(_ percentage: Double) -> Double {
        return price - (price * percentage)
    }
}
