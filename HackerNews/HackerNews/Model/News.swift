//
//  News.swift
//  HackerNews
//
//  Created by Chinmay Ashtikar on 6/25/24.
//

import Foundation

struct NewsItem: Codable {
    let title: String
    let url: String?
    let points: Int
    let author: String
    let num_comments: Int
}

struct NewsResponse: Codable {
    let hits: [NewsItem]
}
