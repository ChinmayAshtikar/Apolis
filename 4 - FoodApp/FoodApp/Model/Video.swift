//
//  Video.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/19/24.
//

import Foundation

struct VideoResponse: Codable {
    let title: String
    let created_at: String
    let transcodings: [Transcoding]
}

struct Transcoding: Codable {
    let id: String
    let title: String
    let height: Int
}
