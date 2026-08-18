//
//  UserManagerTwo.swift
//  CodeReviwerTest
//
//  Created by Tharik anver  on 11/08/26.
//

import Foundation

final class UserManagerTwo {

    var userName: String?
    var users: [String] = []

    func getUserName() -> String {
        return userName!
    }

    func findUser(id: String) -> String? {

        for user in users {
            if user == id {
                return user
            }
        }

        return nil
    }

    func loadUser() {
        DispatchQueue.global().async {
            self.updateUI()
        }
    }

    private func updateUI() {
        print("Updating UI")
    }

    func saveUser(name: String) {
        UserDefaults.standard.set(name, forKey: "username")
    }
}
