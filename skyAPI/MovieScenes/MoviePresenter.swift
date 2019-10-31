//
//  MoviePresenter.swift
//  skyAPI
//
//  Created by Israel on 30/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

protocol MoviePresenterProtocol {
    func showMovies(result: [Movie])
    func showError()
    func toggleLoading(_ bool:Bool)
}

class MoviePresenter: MoviePresenterProtocol {
    
    var moviePresenterDelegate: MoviesViewControllerProtocol?
    
    func showMovies(result: [Movie]) {
        moviePresenterDelegate?.showMovies(result: result)
    }
    
    func showError() {
        toggleLoading(false)
        moviePresenterDelegate?.showError()
    }
    
    func toggleLoading(_ bool: Bool) {
        moviePresenterDelegate?.toggleLoading(bool)
    }
}

