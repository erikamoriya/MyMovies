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
    private var imageHeight: Constraint?

    var viewModel: MoviesListViewModelProtocol? {
        didSet {
            update()
        }
    }

    init(list: UITableView = UITableView()) {
        moviesList = list
        lastMovieName = UILabel()
        lastMovieImageView = UIImageView()
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
        imageHeight?.update(offset: viewModel.getImageHeight())
        layoutIfNeeded()
    }

    func configureViews() {
        lastMovieName.translatesAutoresizingMaskIntoConstraints = false
        lastMovieImageView.translatesAutoresizingMaskIntoConstraints = false
        moviesList.translatesAutoresizingMaskIntoConstraints = false

        moviesList.register(UITableViewCell.self, forCellReuseIdentifier: Constants.celIdentifier)
    }

    func addViews(){
        addSubview(lastMovieImageView)
        addSubview(lastMovieName)
        addSubview(moviesList)
    }

    func buildConstraints() {
        let spacing = Constants.spacing

        lastMovieImageView.snp.makeConstraints { make in
            make.top.equalTo(snp.topMargin).offset(spacing)
            make.centerX.equalTo(snp.centerX)
            imageHeight = make.height.equalTo(60).constraint
        }

        lastMovieName.snp.makeConstraints { make in
            make.top.equalTo(lastMovieImageView.snp.bottom).offset(spacing/2)
            make.centerX.equalTo(snp.centerX)
            make.leading.equalTo(snp.leading).offset(spacing)
            make.trailing.equalTo(snp.trailing).offset(-spacing)
        }

        moviesList.snp.makeConstraints { make in
            make.top.equalTo(lastMovieName.snp.bottom).offset(spacing/2)
            make.leading.equalTo(snp.leading).offset(spacing)
            make.trailing.equalTo(snp.trailing).offset(-spacing)
            make.bottom.equalTo(snp.bottomMargin).offset(-spacing)

        }

//        let lastMovieImageViewConstraints = [
//            lastMovieImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: spacing),
//            lastMovieImageView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
//            imageHeight
//        ]
//        let lastMovieNameConstraints = [
//            lastMovieName.topAnchor.constraint(equalTo: lastMovieImageView.bottomAnchor, constant: spacing/2),
//            lastMovieName.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
//            lastMovieName.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: spacing),
//            lastMovieName.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -spacing)
//        ]
//
//        let moviesListConstraints = [
//            moviesList.topAnchor.constraint(equalTo: lastMovieName.bottomAnchor, constant: spacing),
//            moviesList.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: spacing),
//            moviesList.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -spacing),
//            moviesList.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -spacing)
//
//        ]
    }
}
