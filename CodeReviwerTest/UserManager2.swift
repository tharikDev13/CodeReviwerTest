//
//  UserManager2.swift
//  CodeReviwerTest
//
//  Created by Tharik anver  on 12/08/26.
//

import Foundation

class UserManager2 {

    static let shared = UserManager2()

    var users: [String] = []

    func loadUsers() {

        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if error != nil {
                print(error!)
            }

            let json = try! JSONSerialization.jsonObject(with: data!) as! [[String: Any]]

            for item in json {
                self.users.append(item["name"] as! String)
            }

            print(self.users)
        }

        task.resume()
    }

    func getUser(index: Int) -> String {
        return users[index]
    }
}
