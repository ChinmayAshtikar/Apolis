//
//  NewsViewModelTests.swift
//  FoodAppTests
//
//  Created by Chinmay Ashtikar on 6/25/24.
//

import XCTest
@testable import FoodApp

final class NewsViewModelTests: XCTestCase {

    var viewModel: NewsViewModel?

    override func setUpWithError() throws {
        viewModel = NewsViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchNewsUsingMockData() async throws {
        viewModel?.useMockData = true
        let newsResponse = try await viewModel?.fetchNews()
        XCTAssertEqual(newsResponse?.articles.count, 2)
        XCTAssertEqual(newsResponse?.articles.first?.title, "Sample Article 1")
    }

    func testFetchNewsUsingRealData() async throws {
        viewModel?.useMockData = false
        let newsResponse = try await viewModel?.fetchNews()
        XCTAssertNotNil(newsResponse)
    }
}
