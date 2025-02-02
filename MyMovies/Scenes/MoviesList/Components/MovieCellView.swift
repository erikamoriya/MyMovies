//
//  MovieCellView.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import SnapKit
import UIKit

class MovieCellView: UIView {

    let movieImageView: UIImageView
    let movieName: UILabel
    let movieDescription: UILabel

    var viewModel: MovieCellViewModelProtocol? {
        didSet {
            update()
        }
    }

    init() {
        movieImageView = UIImageView()
        movieName = UILabel()
        movieDescription = UILabel()

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

        movieImageView.image = viewModel.movieImage
        movieName.text = viewModel.movieName
        movieDescription.text = viewModel.movieDescription
    }

    func configureViews() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieName.translatesAutoresizingMaskIntoConstraints = false
        movieDescription.translatesAutoresizingMaskIntoConstraints = false

        movieName.numberOfLines = 1
        movieDescription.numberOfLines = 0
    }

    func addViews(){
        addSubview(movieImageView)
        addSubview(movieName)
        addSubview(movieDescription)
    }

    func buildConstraints() {
        let spacing = Constants.spacing

        self.snp.makeConstraints { make in
            make.height.equalTo(Constants.cellHeight)
        }

        movieImageView.snp.makeConstraints { make in
            make.leading.equalTo(snp.topMargin).offset(spacing)
            make.centerY.equalTo(snp.centerY)
            make.height.equalTo(Constants.imageHeight)
        }

        movieName.snp.makeConstraints { make in
            make.top.equalTo(movieImageView.snp.top)
            make.leading.equalTo(movieImageView.snp.leading).offset(spacing)
            make.trailing.equalTo(snp.trailing).offset(-spacing)
        }

        movieDescription.snp.makeConstraints { make in
            make.top.equalTo(movieName.snp.bottom).offset(spacing/2)
            make.leading.equalTo(movieImageView.snp.leading).offset(spacing)
            make.trailing.equalTo(snp.trailing).offset(-spacing)
            make.bottom.equalTo(snp.bottom).offset(-spacing)
        }
    }
}
