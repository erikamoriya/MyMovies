//
//  Router.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import Foundation

enum Router {
    case trendingMovies
    case movieDetails

    var httpMethod: String {
        switch self {
            case .trendingMovies:
                return "GET"

            case .movieDetails:
                return "POST"
        }
    }

    var parameters: [String: Any] {
        return [:]
    }

    var endPoint: String {
        switch self {
            case .trendingMovies:
                return "GET"

            case .movieDetails:
                return "POST"
        }
    }

    var data: Data? {
        switch self {
            case .trendingMovies:
                let postData = "Antoine van der Lee"
                        let jsonData = try? JSONEncoder().encode(postData)
                return jsonData

            case .movieDetails:
                let postData = "Antoine van der Lee"
                let jsonData = try? JSONEncoder().encode(postData)
                return jsonData
        }
    }
}

