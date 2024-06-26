//
//  NewsViewModel.swift
//  HackerNews
//
//  Created by Chinmay Ashtikar on 6/25/24.
//

import Foundation

class NewsViewModel {
    private var newsItems: [NewsItem] = []
    
    func getNewsCount() -> Int{
        return newsItems.count
    }
    
    func newsItem(at row: Int) -> NewsItem? {
        return newsItems[row]
    }
    
    func fetchNews(completion: @escaping (Result<Void, Error>) -> Void) {
        NetworkManager.shared.fetchNews { [weak self] result in
            switch result {
            case .success(let newsItems):
                self?.newsItems = newsItems
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
