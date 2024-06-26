//
//  VideoViewModelTests.swift
//  FoodAppTests
//
//  Created by Chinmay Ashtikar on 6/25/24.
//

import XCTest
@testable import FoodApp

final class VideoViewModelTests: XCTestCase {

    var viewModel: VideoViewModel?

    override func setUpWithError() throws {
        viewModel = VideoViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchVideosUsingMockData() async throws {
        viewModel?.useMockData = true
        let videos = try await viewModel?.fetchVideos()
        XCTAssertEqual(videos?.count, 2)
        XCTAssertEqual(videos?.first?.title, "Sample Video 1")
    }

    func testFetchVideosUsingRealData() async throws {
        viewModel?.useMockData = false
        let videos = try await viewModel?.fetchVideos()
        XCTAssertNotNil(videos)
    }
}
