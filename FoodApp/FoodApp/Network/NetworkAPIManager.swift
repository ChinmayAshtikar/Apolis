//
//  NetworkAPIManager.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/18/24.
//

import Foundation

class NetworkAPIManager {
    static let shared = NetworkAPIManager()
    
    private init() {}
    
    //  Common Fetch Function
    func fetchData<T: Decodable>( _ urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(ErrorMsg.invalidURL as! Error))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(ErrorMsg.noDataFound as! Error))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
