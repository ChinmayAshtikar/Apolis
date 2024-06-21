//
//  NewsViewModel.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/19/24.
//

import Foundation

class NewsViewModel {
    private var newsResponse: NewsResponse?
    weak var delegate: DataPassDelegate?
    
    func fetchNews() {
        let urlString = Constants.newsURL
        NetworkAPIManager.shared.fetchData(urlString) { (result: Result<NewsResponse, Error>) in
            switch result {
            case .success(let newsResponse):
                DispatchQueue.main.async {
                    self.newsResponse = newsResponse
                   // print("\(newsResponse)")
                    self.delegate?.didFetchData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                   // print("\(error)")
                    self.delegate?.didNotFetchData(error: error)
                }
            }
        }
    }
    
    func getArticles() -> [Article] {
        return newsResponse?.articles ?? []
    }
}
