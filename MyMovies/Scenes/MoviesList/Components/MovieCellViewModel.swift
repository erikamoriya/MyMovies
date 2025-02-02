//
//  MovieCellViewModel.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import UIKit

protocol MovieCellViewModelProtocol {
    var movieImage: UIImage { get }
    var movieName: String { get }
    var movieDescription: String { get }
}

struct MovieCellViewModel: MovieCellViewModelProtocol {
    let movieImage: UIImage
    let movieName: String
    let movieDescription: String
}
