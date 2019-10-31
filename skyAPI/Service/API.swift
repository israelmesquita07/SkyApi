//
//  API.swift
//  skyAPI
//
//  Created by Israel on 30/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

protocol APIService {
    static func getMovies(onComplete:@escaping(Result<[Movie],Error>) -> Void)
}
class API: APIService {
    
    static func getMovies(onComplete:@escaping(Result<[Movie],Error>) -> Void) {
        if let url = URL(string: Endpoint.baseUrl) {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if error == nil {
                    guard let data = data else { return }
                    if let dictJson = self.parseDataToArray(data)
                    {
                        
                        if let model = try? JSONDecoder().decode([Movie].self, from: JSONSerialization.data(withJSONObject: dictJson, options: .prettyPrinted)) {
                            onComplete(.success(model))
                        }
                    }
                    
                } else {
                    onComplete(.failure(error!))
                }
            }
            dataTask.resume()
        }
    }
    
    private static func parseDataToArray(_ data:Data) -> Array<Any>? {
        
        if let dictJson = try? JSONSerialization.jsonObject(with: data, options: []) as? Array<Any> {
            return dictJson
        }
        return nil
    }
}
