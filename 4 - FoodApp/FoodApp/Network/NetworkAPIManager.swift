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

