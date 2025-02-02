//
//  MoviesListView.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import SnapKit
import UIKit

class MoviesListView: UIView {

    let lastMovieImageView: UIImageView
    let lastMovieName: UILabel
    let moviesList: UITableView
    private var imageHeight: NSLayoutConstraint

    var viewModel: MoviesListViewModelProtocol? {
        didSet {
            update()
        }
    }

    init(list: UITableView = UITableView()) {
        moviesList = list
        lastMovieName = UILabel()
        lastMovieImageView = UIImageView()
        imageHeight = lastMovieName.heightAnchor.constraint(equalToConstant: 0)
        super.init()
        configureViews()
        addViews()
        buildConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update() {
        guard let viewModel else {
            debugPrint("[MoviesListView] error to retrieve viewModel")
            return
        }

        lastMovieImageView.image = viewModel.lastMovieImage
        lastMovieName.text = viewModel.lastMovieName
        imageHeight.constant = viewModel.getImageHeight()
        layoutIfNeeded()
    }

    func configureViews() {
        lastMovieName.translatesAutoresizingMaskIntoConstraints = false
        lastMovieImageView.translatesAutoresizingMaskIntoConstraints = false
        moviesList.translatesAutoresizingMaskIntoConstraints = false
    }

    func addViews(){
        addSubview(lastMovieImageView)
        addSubview(lastMovieName)
        addSubview(moviesList)
    }

    func buildConstraints() {
        let spacing = Constants.spacing

        let lastMovieImageViewConstraints = [
            lastMovieImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: spacing),
            lastMovieImageView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
            imageHeight
        ]
        let lastMovieNameConstraints = [
            lastMovieName.topAnchor.constraint(equalTo: lastMovieImageView.bottomAnchor, constant: spacing/2),
            lastMovieName.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
            lastMovieName.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: spacing),
            lastMovieName.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -spacing)
        ]

        let moviesListConstraints = [
            moviesList.topAnchor.constraint(equalTo: lastMovieName.bottomAnchor, constant: spacing),
            moviesList.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: spacing),
            moviesList.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -spacing),
            moviesList.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -spacing)

        ]
    }
}
