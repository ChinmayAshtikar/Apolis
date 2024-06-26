//
//  FoodAppTests.swift
//  FoodAppTests
//
//  Created by Chinmay Ashtikar on 6/24/24.
//

import XCTest
@testable import FoodApp

final class UserViewModelTests: XCTestCase {

    var viewModel: UserViewModel?

    override func setUpWithError() throws {
        viewModel = UserViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchUsersUsingMockData() async throws {
        viewModel?.useMockData = true
        let users = try await viewModel?.fetchUsers()
        XCTAssertEqual(users?.count, 2)
        XCTAssertEqual(users?.first?.name, "John Doe")
    }

    func testFetchUsersUsingRealData() async throws {
        viewModel?.useMockData = false
        let users = try await viewModel?.fetchUsers()
        XCTAssertNotNil(users)
    }
}

