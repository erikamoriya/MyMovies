//
//  MoviesListViewModel.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import UIKit

protocol MoviesListViewModelProtocol {
    var attributionImage: UIImage { get }
}

struct MoviesListViewModel: MoviesListViewModelProtocol {
    var attributionImage: UIImage = UIImage(named: Constants.movieAttribuitionLogo) ?? UIImage()
}
