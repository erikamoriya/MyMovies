//
//  Router.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import Foundation

enum Router {
    case nowPlaying
    case movieDetails(movieId: Int32)
    case downloadImage(path: String)

    var httpMethod: String {
        switch self {
            case .nowPlaying:
                return Constants.httpMethodGet

            case .movieDetails:
                return Constants.httpMethodGet

            case .downloadImage:
                return Constants.httpMethodGet
        }
    }

    var parameters: [String: String] {
        switch self {
            case .nowPlaying:
                return [
                    "language": "PT-BR",
                    "page": "1"
                ]

            default:
                return [:]
        }
    }

    var headers: [String: String] {
        let apiKey = ProcessInfo().environment["API_KEY"] ?? String()
        return [
            "Authorization": apiKey,
            "accept": "application/json"
        ]
    }

    var endPoint: String {
        switch self {
            case .nowPlaying:
                return "https://api.themoviedb.org/3/movie/now_playing?language=pt-BR&region=BR&page=1&sort_by=popularity.desc&with_release_type=2|3"

            case let .movieDetails(movieId):
                return "https://api.themoviedb.org/3/movie/\(movieId)"

            case let .downloadImage(path):
                return Constants.basicURL + path
        }
    }
}

