//
//  APIClient.swift
//  CodeReviwerTest
//
//  Created by Tharik anver  on 11/08/26.
//

import Foundation

final class APIClient {

    static let shared = APIClient()

    private let baseURL = "https://api.example.com"

    func getUsers(completion: @escaping ([User]?) -> Void) {

        let url = URL(string: "\(baseURL)/users")!

        URLSession.shared.dataTask(with: url) { data, response, error in

            if error != nil {
                completion(nil)
                return
            }

            let users = try? JSONDecoder().decode(
                [User].self,
                from: data!
            )

            DispatchQueue.main.async {
                completion(users)
            }

        }.resume()
    }

    func deleteUser(id: Int, completion: @escaping (Bool) -> Void) {

        let url = URL(string: "\(baseURL)/users/\(id)")!

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        URLSession.shared.dataTask(with: request) { _, _, _ in
            completion(true)
        }.resume()
    }
}
