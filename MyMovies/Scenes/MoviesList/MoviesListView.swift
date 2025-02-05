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

    var viewModel: MoviesListViewModelProtocol? {
        didSet {
            update()
        }
    }

    init(list: UITableView = UITableView()) {
        moviesList = list
        lastMovieName = UILabel()
        lastMovieImageView = UIImageView()
        super.init(frame: UIScreen.main.bounds)
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
        layoutIfNeeded()
    }

    func configureViews() {
        lastMovieName.translatesAutoresizingMaskIntoConstraints = false
        lastMovieImageView.translatesAutoresizingMaskIntoConstraints = false
        moviesList.translatesAutoresizingMaskIntoConstraints = false
        lastMovieImageView.contentMode = .scaleAspectFit
        moviesList.register(MovieCellView.self, forCellReuseIdentifier: Constants.celIdentifier)
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
            make.height.equalTo(80)
        }

        lastMovieName.snp.makeConstraints { make in
            make.top.equalTo(lastMovieImageView.snp.bottom).offset(spacing/2)
            make.centerX.equalTo(snp.centerX)
            make.leading.greaterThanOrEqualTo(snp.leading).offset(spacing)
            make.trailing.lessThanOrEqualTo(snp.trailing).offset(-spacing)
        }

        moviesList.snp.makeConstraints { make in
            make.top.equalTo(lastMovieName.snp.bottom).offset(spacing/2)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing).offset(-spacing)
            make.bottom.equalTo(snp.bottomMargin).offset(-spacing)
        }
    }
}
