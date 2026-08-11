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

    func hasValidEmail() -> Bool {
        return email.contains("@")
    }
}
