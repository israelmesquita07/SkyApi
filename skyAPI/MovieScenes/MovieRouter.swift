//
//  MovieRouter.swift
//  skyAPI
//
//  Created by Israel on 31/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit

protocol MovieViewControllerRouterInput {
    func navigateToDetailsViewController(_ movie:Movie)
}

class MovieRouter: MovieViewControllerRouterInput {
    
    var movieRouterDelegate: UIViewController?

    func navigateToDetailsViewController(_ movie:Movie) {
        if let detailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsMovieViewController") as? DetailsMovieViewController {
            detailsViewController.movie = movie
            movieRouterDelegate?.navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}
