//
//  ImageDownloader2.swift
//  CodeReviwerTest
//
//  Created by Tharik anver  on 03/08/26.
//

import Foundation

final class ImageDownloader2 {

    static let shared = ImageDownloader2()

    private var cache: [String: Data] = [:]

    func downloadImage(urlString: String, completion: @escaping (Data?) -> Void) {

        if cache[urlString] != nil {
            completion(cache[urlString])
            return
        }

        let url = URL(string: urlString)!

        URLSession.shared.dataTask(with: url) { data, response, error in

            if error != nil {
                print(error!)
            }

            let imageData = data!

            self.cache[urlString] = imageData

            completion(imageData)

        }.resume()
    }

    func clearCache() {
        cache.removeAll()
    }

    func image(at index: Int) -> Data {
        return Array(cache.values)[index]
    }
}
