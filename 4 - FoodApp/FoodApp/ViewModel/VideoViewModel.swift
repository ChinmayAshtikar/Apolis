//
//  VideoViewModel.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/19/24.
//

import Foundation

class VideoViewModel {
    private var videoResponses: [VideoResponse] = []
    weak var delegate: DataPassDelegate?
    var useMockData = false
    
    func fetchVideos() async throws -> [VideoResponse]? {
        let urlString = Constants.videoURL
        if useMockData {
            let result = try await MockAPIManager.shared.fetchData(for: [VideoResponse].self, url: urlString)
            if let result = result {
                self.videoResponses = result
                return result
            }
        } else {
            let result = try await NetworkAPIManager.shared.fetchData(for: [VideoResponse].self, url: urlString)
            if let result = result {
                self.videoResponses = result
                return result
            }
        }
        return nil
    }
    
    func getVideoResponses() -> [VideoResponse] {
        return videoResponses
    }
    
    func getTranscodings() -> [Transcoding] {
        return videoResponses.flatMap { $0.transcodings }
    }
}
