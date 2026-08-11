//
//  Product.swift
//  CodeReviwerTest
//
//  Created by Tharik anver  on 11/08/26.
//

import Foundation

struct Product: Identifiable, Codable {
    let id: Int
    let name: String
    let price: Double
    let imageURL: String?

    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: NSNumber(value: price)) ?? "$\(price)"
    }

    /// Calculates discounted price
    /// - Parameter percentage: Discount percentage (0.0 to 1.0, e.g., 0.1 for 10% off)
    /// - Returns: The discounted price, ensuring it doesn't go below 0
    func discountedPrice(_ percentage: Double) -> Double {
        let validPercentage = max(0, min(percentage, 1))
        let discount = price * validPercentage
        return max(0, price - discount)
    }
}
