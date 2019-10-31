//
//  MoviesViewController.swift
//  skyAPI
//
//  Created by Israel on 29/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit

protocol MoviesViewControllerProtocol {
    func getMovies()
    func showMovies(result: [Movie])
    func showError()
    func toggleLoading(_ bool:Bool)
}

class MoviesViewController: UIViewController, MoviesViewControllerProtocol {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellIdentifier:String = "movieCell"
    private var presenter:MoviePresenter = MoviePresenter()
    private var interactor:MovieInteractor = MovieInteractor()
    private var router: MovieRouter = MovieRouter()
    private let activityIndicator = UIActivityIndicatorView()
    private let refreshControl = UIRefreshControl()
    private var moviesArray:[Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupRefreshControl()
        getMovies()
    }
    
    private func setupRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(string: "Atualizando filmes...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        refreshControl.addTarget(self, action: #selector(refreshMovies(_:)), for: .valueChanged)
        collectionView.addSubview(refreshControl)
    }
    
    @objc private func refreshMovies(_ sender: Any) {
        getMovies()
    }
    
    private func setupCollectionView() {
        let cellNib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func getMovies() {
        toggleLoading(true)
        router.movieRouterDelegate = self
        presenter.moviePresenterDelegate = self
        interactor.movieInteractorDelegate = presenter
        interactor.getMovies()
    }
    
    func showMovies(result: [Movie]) {
        moviesArray = result
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.toggleLoading(false)
        }
    }
    
    func showError() {
        DispatchQueue.main.async {
            self.showAlert(title: "Ops!", message: "Ocorreu um erro!")
        }
    }
    
    func toggleLoading(_ bool: Bool) {
        if bool {
            startLoading()
            return
        }
        stopLoading()
    }
    
    private func showAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func startLoading() {
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        activityIndicator.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        activityIndicator.startAnimating()
        
        view.addSubview(activityIndicator)
        view.isUserInteractionEnabled = false
    }
    
    private func stopLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.refreshControl.endRefreshing()
            self.activityIndicator.stopAnimating()
            self.view.isUserInteractionEnabled = true
        }
    }
}

//MARK: - UICollectionViewDataSource
extension MoviesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MovieCollectionViewCell
        
        let screenWidth = self.collectionView.frame.width
        let movie = moviesArray[indexPath.row]
        cell.setupCell(movie, screenWidth: screenWidth)
        
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate
extension MoviesViewController: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = moviesArray[indexPath.row]
        router.navigateToDetailsViewController(movie)
    }
}
