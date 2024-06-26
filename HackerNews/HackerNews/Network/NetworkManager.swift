//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Chinmay Ashtikar on 6/25/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchNews(completion: @escaping (Result<[NewsItem], Error>) -> Void) {
        let urlString = "https://hn.algolia.com/api/v1/search?tags=front_page"
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                completion(.success(newsResponse.hits))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
