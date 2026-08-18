//
//  User.swift
//  CodeReviwerTest
//
//  Created by Tharik anver  on 11/08/26.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    var name: String
    var email: String
    var profileImageURL: String?
    var isActive: Bool

    var displayName: String {
        return name.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Validates email format using regex pattern
    /// - Returns: True if email appears to be valid
    func hasValidEmail() -> Bool {
        // RFC 5322 simplified email validation pattern
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
        return predicate.evaluate(with: email)
    }
}
