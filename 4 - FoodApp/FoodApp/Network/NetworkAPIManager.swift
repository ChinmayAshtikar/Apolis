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
    
    func fetchData<T: Decodable>(for type: T.Type, url: String) async throws -> T? {
        if let url = URL(string: url)  {
            let (data, response) = try await URLSession.shared.data(from: url)
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                return serverData
            }
            catch {
                print("Issue while parsing data: \(error)")
                return nil
            }
        }
        return nil
    }
}
    
    
    //  Common Fetch Function
//    func fetchData<T: Decodable>( _ urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
//        guard let url = URL(string: urlString) else {
//            completion(.failure(ErrorMsg.invalidURL as! Error))
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(ErrorMsg.noDataFound as! Error))
//                return
//            }
//
//            do {
//                let result = try JSONDecoder().decode(T.self, from: data)
//                completion(.success(result))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
