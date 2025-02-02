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
    func getImageHeight() -> CGFloat
}

struct MoviesListViewModel: MoviesListViewModelProtocol {
    var lastMovieImage: UIImage
    var lastMovieName: String
    
    func getImageHeight() -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height

        if screenHeight/12 > 60 {
            return 60
        }
        return screenHeight/12
    }
}
