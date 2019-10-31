
//
//  MovieInteractor.swift
//  skyAPI
//
//  Created by Israel on 30/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

protocol MovieInteractorProtocol {
    func getMovies()
}

class MovieInteractor: MovieInteractorProtocol {
    
    var movieInteractorDelegate: MoviePresenterProtocol?
    private var worker: MovieWorker?
    
    func getMovies() {
     
        movieInteractorDelegate?.toggleLoading(true)
        worker = MovieWorker()
        worker?.getMovies(onComplete: { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let movies):
                self.movieInteractorDelegate?.showMovies(result: movies)
                break
            case .failure(let error):
                print(error.localizedDescription)
                self.movieInteractorDelegate?.showError()
                break
            }
        })
        worker = nil
    }
}
