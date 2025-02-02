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

    func downloadImage(service: ServiceProtocol) -> UIImage {

    }
}
