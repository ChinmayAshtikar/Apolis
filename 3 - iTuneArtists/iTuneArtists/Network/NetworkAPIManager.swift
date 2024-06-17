//
//  NetworkAPIManager.swift
//  iTuneArtists
//
//  Created by Chinmay Ashtikar on 6/12/24.
//

import Foundation
import Alamofire

class NetworkAPIManager {
    static let shared = NetworkAPIManager()
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    //private init() {}
    
    //    func fetchArtists(){
    //        AF.request(Constants.artistURL.rawValue).response { response in
    //            debugPrint(response)
    //        }
    //    }
    func fetchArtists(urlString: String = Constants.artistURL.rawValue, completion: @escaping ([Artist]?, Error?) -> Void) {
            guard let url = URL(string: urlString) else {
                completion(nil, ServerError.apiError as? Error)
                return
            }
            let task = session.dataTask(with: url) { (data, response, error) in
                guard let serverData = data, error == nil else {
                    completion(nil, error)
                    return
                }
                do {
                    let result = try JSONDecoder().decode(SearchResponse.self, from: serverData)
                    completion(result.results, nil)
                } catch {
                    completion(nil, error)
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



