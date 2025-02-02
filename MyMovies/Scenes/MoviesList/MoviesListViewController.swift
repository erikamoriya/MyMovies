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
        super.init()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        myView.moviesList.delegate = self
        myView.moviesList.dataSource = self

        view = myView
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func loadData() async {
        do {
            let movies = try await service.getNowPlaying(router: .nowPlaying)
            moviesList.append(contentsOf: movies)
            myView.moviesList.reloadData()
        } catch {
            debugPrint("[MoviesListViewController] error from download")
        }
    }
}

extension MoviesListViewController: UITableViewDelegate {

}

extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard moviesList.count > indexPath.row else {
            debugPrint("[MoviesListViewController] Error finding movie")
            return UITableViewCell()
        }
//        let movieImage = moviesList[indexPath.row].image
//        let movieName = moviesList[indexPath.row].name
//        let movieDescription = moviesList[indexPath.row].synopsis
//        let cellViewModel = MovieCellViewModel(movieImage: UI, movieName: <#String#>, movieDescription: <#String#>)
//        let cellView = MovieCellView()
//
//
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.celIdentifier, for: indexPath)
//            cell.contentView =
//            return cell
//
//
//
//        moviesList.dequeueReusableCell(withIdentifier: Constants.celIdentifier)

    }
    

}
