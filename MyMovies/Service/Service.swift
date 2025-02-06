//
//  Service.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import UIKit

protocol ServiceProtocol {
    func getAuthentication(router: Router) async throws
    func getNowPlaying(router: Router) async throws -> [Movie]
    func getMovieDetails(router: Router) async throws -> MovieDetails? // remover o nil
    func downloadImage(router: Router) async -> Data?
}

import Foundation

class Service: ServiceProtocol {
    func getAuthentication(router: Router) async {
        guard let url = URL(string: router.endPoint) else {
            debugPrint("[Service getAuthentication] problems with url")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = router.httpMethod
        request.allHTTPHeaderFields = router.headers

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            debugPrint("[Service getAuthentication] data: \(String(decoding: data, as: UTF8.self)), response: \(response)")
        } catch {
            debugPrint("[Service getAuthentication] problems with response")
        }
    }
    
    func getNowPlaying(router: Router) async throws -> [Movie] {
        guard var urlComponents = URLComponents(string: router.endPoint) else {
            debugPrint("[Service] problems with authentication")
            return []
        }

        urlComponents.queryItems = router.parameters.map { key, value in
            URLQueryItem(name: key, value: value)
        }

        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = router.httpMethod
        request.allHTTPHeaderFields = router.headers

        do {
            let (data, response) = try await URLSession.shared.data(for: request) // precisa ainda fazer um tratamento aqui para http error
            let decodedResponse = try JSONDecoder().decode(MovieList.self, from: data)
            return decodedResponse.results
        } catch {
            debugPrint("[Service] problems with decoder")
        }
        return []
    }
    
    func getMovieDetails(router: Router) async throws -> MovieDetails? {
        guard var url = URL(string: router.endPoint) else {
            debugPrint("[Service] problems with endpoint")
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = router.httpMethod
        request.allHTTPHeaderFields = router.headers

        do {
            let (data, response) = try await URLSession.shared.data(for: request) // precisa ainda fazer um tratamento aqui para http error
            let decodedResponse = try JSONDecoder().decode(MovieDetails.self, from: data)
            return decodedResponse
        } catch {
            debugPrint("[Service] problems with decoder")
        }
        return nil
    }

    func downloadImage(router: Router) async -> Data? {
        guard var url = URL(string: router.endPoint) else {
            debugPrint("[Service] problems with endpoint")
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = router.httpMethod
        request.allHTTPHeaderFields = router.headers

        do {
            let (data, response) = try await URLSession.shared.data(for: request) // precisa ainda fazer um tratamento aqui para http error
            return data
        } catch {
            debugPrint("[Service] problems with image download")
        }
        return nil
    }
}
