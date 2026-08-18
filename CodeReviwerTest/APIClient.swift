//
//  APIClient.swift
//  CodeReviwerTest
//
//  Created by Tharik anver  on 11/08/26.
//

import Foundation

/// Custom error type for API operations
enum APIError: Error, LocalizedError {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case decodingError(Error)
    case httpError(statusCode: Int)
    case noData

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid server response"
        case .decodingError(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        case .httpError(let statusCode):
            return "HTTP error with status code: \(statusCode)"
        case .noData:
            return "No data received from server"
        }
    }
}

final class APIClient {
    static let shared = APIClient()

    private let baseURL: String
    private let session: URLSession

    /// Initializes APIClient with optional custom base URL
    /// - Parameter baseURL: The base URL for API endpoints. Defaults to example API.
    init(baseURL: String = "https://api.example.com", session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }

    /// Fetches users from the API
    /// - Returns: An array of User objects
    func getUsers() async throws -> [User] {
        guard let url = URL(string: "\(baseURL)/users") else {
            throw APIError.invalidURL
        }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.httpError(statusCode: httpResponse.statusCode)
        }

        do {
            let users = try JSONDecoder().decode([User].self, from: data)
            return users
        } catch {
            throw APIError.decodingError(error)
        }
    }

    /// Deletes a user by ID
    /// - Parameter id: The ID of the user to delete
    /// - Returns: True if deletion was successful
    func deleteUser(id: Int) async throws -> Bool {
        guard let url = URL(string: "\(baseURL)/users/\(id)") else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        let (_, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.httpError(statusCode: httpResponse.statusCode)
        }

        return true
    }
}
