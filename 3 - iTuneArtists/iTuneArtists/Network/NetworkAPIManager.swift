//
//  NetworkAPIManager.swift
//  iTuneArtists
//
//  Created by Chinmay Ashtikar on 6/12/24.
//

import Foundation

class NetworkAPIManager {
    static let shared = NetworkAPIManager()
    
    func fetchArtists(closure: @escaping ([Artist]?) -> Void) {
        guard let url = URL(string: Constants.artistURL.rawValue) else {
            closure(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let serverData = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(SearchResponse.self, from: serverData)
                closure(result.results)
            } catch {
                print(ServerError.apiError.rawValue)
                closure(nil)
            }
        }
        task.resume()
    }
    
    func fetchImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data, error == nil else {
                completion(nil)
                return
            }
            completion(imageData)
        }
        task.resume()
    }
}
