//
//  MovieCellView.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import SnapKit
import UIKit

class MovieCellView: UITableViewCell {

    let movieImageView: UIImageView
    let movieName: UILabel
    let movieDescription: UILabel
    let stackViewVertical: UIStackView
    let stackViewHorizontal: UIStackView

    var viewModel: MovieCellViewModelProtocol? {
        didSet {
            update()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        movieImageView = UIImageView()
        movieName = UILabel()
        movieDescription = UILabel()
        stackViewVertical = UIStackView()
        stackViewHorizontal = UIStackView()

        super.init(style: style, reuseIdentifier: reuseIdentifier)
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

        movieImageView.contentMode = .scaleAspectFit

        movieName.numberOfLines = 1
        movieDescription.numberOfLines = 0

        stackViewVertical.axis = .vertical
        stackViewHorizontal.axis = .horizontal
    }

    func addViews(){
        stackViewHorizontal.addArrangedSubview(movieImageView)
        stackViewHorizontal.addArrangedSubview(stackViewVertical)
        stackViewVertical.addArrangedSubview(movieName)
        stackViewVertical.addArrangedSubview(movieDescription)

        addSubview(stackViewHorizontal)
    }

    func buildConstraints() {
        let spacing = Constants.spacing

        movieImageView.snp.makeConstraints { make in
            make.width.height.equalTo(Constants.imageHeight)
        }

        stackViewHorizontal.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(spacing)
            make.leading.equalTo(snp.leading).offset(spacing)
            make.trailing.equalTo(snp.trailing).offset(-spacing)
            make.bottom.equalTo(snp.bottom).offset(-spacing)
            make.height.equalTo(Constants.cellHeight)
        }
    }
}
