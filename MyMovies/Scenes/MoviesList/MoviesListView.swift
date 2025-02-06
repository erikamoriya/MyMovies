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
    let moviesList: UITableView

    var viewModel: MoviesListViewModelProtocol? {
        didSet {
            update()
        }
    }

    init(list: UITableView = UITableView()) {
        moviesList = list
        lastMovieImageView = UIImageView()
        super.init(frame: .zero)
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

        lastMovieImageView.image = viewModel.attributionImage
        layoutIfNeeded()
    }

    func configureViews() {
        lastMovieImageView.translatesAutoresizingMaskIntoConstraints = false
        moviesList.translatesAutoresizingMaskIntoConstraints = false
        lastMovieImageView.contentMode = .scaleAspectFit
        moviesList.register(MovieCellView.self, forCellReuseIdentifier: Constants.celIdentifier)
        backgroundColor = .white
    }

    func addViews(){
        addSubview(lastMovieImageView)
        addSubview(moviesList)
    }

    func buildConstraints() {
        let spacing = Constants.spacing

        lastMovieImageView.snp.makeConstraints { make in
            make.top.equalTo(snp.topMargin).offset(spacing)
            make.centerX.equalTo(snp.centerX)
            make.height.equalTo(80)
        }

        moviesList.snp.makeConstraints { make in
            make.top.equalTo(lastMovieImageView.snp.bottom).offset(spacing/2)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing).offset(-spacing)
            make.bottom.equalTo(snp.bottomMargin).offset(-spacing)
        }
    }
}
