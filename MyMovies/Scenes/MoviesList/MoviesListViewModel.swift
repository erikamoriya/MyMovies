//
//  MoviesListViewModel.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import UIKit

protocol MoviesListViewModelProtocol {
    var lastMovieImage: UIImage { get }
    var lastMovieName: String { get }
}

struct MoviesListViewModel: MoviesListViewModelProtocol {
    var lastMovieImage: UIImage
    var lastMovieName: String
}
