//
//  PersonViewModelTests.swift
//  FoodAppTests
//
//  Created by Chinmay Ashtikar on 6/25/24.
//

import XCTest
@testable import FoodApp

final class PersonViewModelTests: XCTestCase {

    var viewModel: PersonViewModel?

    override func setUpWithError() throws {
        viewModel = PersonViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchPersonUsingMockData() async throws {
        viewModel?.useMockData = true
        let person = try await viewModel?.fetchPerson()
        XCTAssertEqual(person?.name, "Chinmay Ashtikar")
        XCTAssertEqual(person?.height, "200")
        XCTAssertEqual(person?.birth_year, "19BBY")
        XCTAssertEqual(person?.gender, "male")
    }

    func testFetchPersonUsingRealData() async throws {
        viewModel?.useMockData = false
        let person = try await viewModel?.fetchPerson()
        XCTAssertNotNil(person)
    }
}
