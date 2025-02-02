//
//  Router.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import Foundation

enum Router {
    case nowPlaying
    case movieDetails
    case downloadImage(path: String)

    var httpMethod: String {
        switch self {
            case .nowPlaying:
                return Constants.httpMethodGet

            case .movieDetails:
                return Constants.httpMethodPost

            case .downloadImage:
                return Constants.httpMethodGet
        }
    }

    var parameters: [String: Any] {
        return [:]
    }

    var endPoint: String {
        switch self {
            case .nowPlaying:
                return "https://api.themoviedb.org/3/movie/now_playing?language=pt-BR&region=BR"

            case .movieDetails:
                return "POST"

            case let .downloadImage(path):
                return Constants.basicURL + path
        }
    }

    var data: Data? {
        switch self {
            case .nowPlaying:
                let postData = "Antoine van der Lee"
                        let jsonData = try? JSONEncoder().encode(postData)
                return jsonData

            case .movieDetails:
                let postData = "Antoine van der Lee"
                let jsonData = try? JSONEncoder().encode(postData)
                return jsonData

            default:
                return nil
        }
    }
}

