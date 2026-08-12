//
//  ImageLoader.swift
//  CodeReviwerTest
//
//  Created by Tharik anver  on 12/08/26.
//

import Foundation
import UIKit

final class ImageLoader {

    static let shared = ImageLoader()

    private var cache: [String: UIImage] = [:]

    func loadImage(
        from urlString: String,
        completion: @escaping (UIImage?) -> Void
    ) {

        if let cachedImage = cache[urlString] {
            completion(cachedImage)
            return
        }

        let url = URL(string: urlString)!

        URLSession.shared.dataTask(with: url) { data, _, _ in

            guard let data else {
                completion(nil)
                return
            }

            let image = UIImage(data: data)

            self.cache[urlString] = image

            completion(image)
        }.resume()
    }
}
