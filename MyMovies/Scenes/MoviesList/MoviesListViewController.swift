//
//  MoviesListViewController.swift
//  MyMovies
//
//  Created by Érika Moriya on 02/02/25.
//

import UIKit

class MoviesListViewController: UIViewController {

    private let service: ServiceProtocol
    private let myView: MoviesListView
    private var moviesList: [Movie]


    init(myView: MoviesListView = MoviesListView(), service: ServiceProtocol = Service()) {
        self.myView = myView
        self.moviesList = []
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        myView.moviesList.delegate = self
        myView.moviesList.dataSource = self
        view = myView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await loadData()
        }
    }

    private func loadData() async {
        do {
            let movies = try await service.getNowPlaying(router: .nowPlaying)
            let viewModel = MoviesListViewModel()
            myView.viewModel = viewModel
            moviesList.append(contentsOf: movies)
            myView.moviesList.reloadData()
        } catch {
            debugPrint("[MoviesListViewController] error from download")
        }
    }
}

extension MoviesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard moviesList.count > indexPath.row else {
            debugPrint("[MoviesListViewController] error getting cell info")
            return
        }
        let movieId = moviesList[indexPath.row].id
        let vc = MovieDetailsViewController(movieId: movieId)
        present(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.cellHeight
    }
}

extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            moviesList.count > indexPath.row,
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.celIdentifier, for: indexPath) as? MovieCellView
        else {
            debugPrint("[MoviesListViewController] Error finding movie")
            return UITableViewCell()
        }

        let movie = moviesList[indexPath.row]
        let movieName = movie.name
        let movieDescription = movie.synopsis

        Task {
            let image = await movie.downloadImage(service: service)
            if let updatedCell = tableView.cellForRow(at: indexPath) as? MovieCellView {
                let cellViewModel = MovieCellViewModel(
                    movieImage: UIImage(),
                    movieName: movieName,
                    movieDescription: movieDescription
                )
                updatedCell.viewModel = cellViewModel
                updatedCell.update()
            }
        }
        return cell
    }
}
