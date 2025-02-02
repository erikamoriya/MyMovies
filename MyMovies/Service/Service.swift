//
//  Service.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import Foundation

protocol ServiceProtocol {
    func getTrendingMovies(router: Router) async throws -> [Movie]
    func getMovieDetails(router: Router, id: Int32) async throws -> Movie
}


class Service: ServiceProtocol {
    func getTrendingMovies(router: Router) async throws -> [Movie] {
        <#code#>
    }
    
    func getMovieDetails(router: Router, id: Int32) async throws -> Movie {
        <#code#>
    }
}
