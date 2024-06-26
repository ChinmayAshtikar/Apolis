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
    var useMockData = false

    func fetchNews() async throws -> NewsResponse? {
        let urlString = Constants.newsURL
        if useMockData {
            let result = try await MockAPIManager.shared.fetchData(for: NewsResponse.self, url: urlString)
            if let result = result {
                self.newsResponse = result
                return result
            }
        } else {
            let result = try await NetworkAPIManager.shared.fetchData(for: NewsResponse.self, url: urlString)
            if let result = result {
                self.newsResponse = result
                return result
            }
        }
        return nil
    }

    func getArticles() -> [Article] {
        return newsResponse?.articles ?? []
    }
}
