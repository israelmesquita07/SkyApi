//
//  MovieWorker.swift
//  skyAPI
//
//  Created by Israel on 30/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

class MovieWorker {
    
    func getMovies(onComplete:@escaping(Result<[Movie],Error>) -> Void) {
        
        API.getMovies { (result) in
            onComplete(result)
        }
    }
}
