//
//  Service.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import UIKit

protocol ServiceProtocol {
    func getNowPlaying(router: Router) async throws -> [Movie]
    func getMovieDetails(router: Router, id: Int32) async throws -> Movie? // remover o nil
    func downloadImage(router: Router) -> Data?
}

class Service: ServiceProtocol {
    func getNowPlaying(router: Router) async throws -> [Movie] {
        [
            Movie(name: "A", synopsis: "arvore", posterPath: "1E5baAaEse26fej7uHcjOgEE2t2.jpg"),
            Movie(name: "B", synopsis: "arvore", posterPath: "1E5baAaEse26fej7uHcjOgEE2t2.jpg"),
            Movie(name: "C", synopsis: "arvore", posterPath: "1E5baAaEse26fej7uHcjOgEE2t2.jpg"),
            Movie(name: "D", synopsis: "arvore", posterPath: "1E5baAaEse26fej7uHcjOgEE2t2.jpg"),
            Movie(name: "E", synopsis: "arvore", posterPath: "1E5baAaEse26fej7uHcjOgEE2t2.jpg"),
            Movie(name: "F", synopsis: "arvore", posterPath: "1E5baAaEse26fej7uHcjOgEE2t2.jpg"),
            Movie(name: "G", synopsis: "arvore", posterPath: "1E5baAaEse26fej7uHcjOgEE2t2.jpg"),
            Movie(name: "H", synopsis: "arvore", posterPath: "1E5baAaEse26fej7uHcjOgEE2t2.jpg")
        ]
    }
    
    func getMovieDetails(router: Router, id: Int32) async throws -> Movie? {
        nil
    }

    func downloadImage(router: Router) -> Data? {
        return UIImage(systemName: Constants.movieImagePlaceholder)?.pngData()
    }
}
