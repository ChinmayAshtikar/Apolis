//
//  VideoViewModel.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/19/24.
//

import Foundation

import Foundation

class VideoViewModel {
    private var videoResponses: [VideoResponse] = []
    weak var delegate: DataPassDelegate?
    
    func fetchVideos() async throws -> [VideoResponse]? {
        let urlString = Constants.videoURL
        let result = try await NetworkAPIManager.shared.fetchData(for: [VideoResponse].self, url: urlString)
        if let result = result {
            self.videoResponses = result
            return result
        }
        return nil
    }
    
    func getVideoResponses() -> [VideoResponse] {
        return videoResponses
    }
    
    func getTranscodings() -> [Transcoding] {
        return videoResponses.flatMap { $0.transcodings }
    }
    
//    func fetchVideos() {
//        let urlString = Constants.videoURL
//        NetworkAPIManager.shared.fetchData(urlString) { (result: Result<[VideoResponse], Error>) in
//            switch result {
//            case .success(let videoResponses):
//                DispatchQueue.main.async {
//                    self.videoResponses = videoResponses
//                    //print("video responses: \(videoResponses)")
//                    self.delegate?.didFetchData()
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    //print("\(error)")
//                    self.delegate?.didNotFetchData(error: error)
//                }
//            }
//        }
//    }
//    
//    func getVideoResponses() -> [VideoResponse] {
//        return videoResponses
//    }
//    
//    func getTranscodings() -> [Transcoding] {
//        return videoResponses.flatMap { $0.transcodings }
//    }
}
