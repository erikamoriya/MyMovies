//
//  Movie.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import UIKit

struct Movie: Decodable {
    let name: String
    let synopsis: String
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case name = "title"
        case synopsis = "overview"
        case posterPath = "poster_path"
    }

    func downloadImage(service: ServiceProtocol) -> UIImage {
        if let data = service.downloadImage(router: .downloadImage(path: posterPath)),
            let image = UIImage(data: data) {
            return image
        }
        return UIImage(systemName: Constants.movieImagePlaceholder) ?? UIImage()
    }
}
