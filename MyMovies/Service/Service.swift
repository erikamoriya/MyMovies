//
//  Service.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import Foundation

protocol ServiceProtocol {
    func getNowPlaying(router: Router) async throws -> [Movie]
    func getMovieDetails(router: Router, id: Int32) async throws -> Movie? // remover o nil
}

class Service: ServiceProtocol {
    func getNowPlaying(router: Router) async throws -> [Movie] {
[]
    }
    
    func getMovieDetails(router: Router, id: Int32) async throws -> Movie? {
        nil
    }
}
