//
//  MealViewModelTests.swift
//  FoodAppTests
//
//  Created by Chinmay Ashtikar on 6/25/24.
//

import XCTest
@testable import FoodApp

final class MealViewModelTests: XCTestCase {

    var viewModel: MealViewModel?

    override func setUpWithError() throws {
        viewModel = MealViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchMealsUsingMockData() async throws {
        viewModel?.useMockData = true
        let mealResponse = try await viewModel?.fetchMeals()
        XCTAssertEqual(mealResponse?.meals.count, 2)
        XCTAssertEqual(mealResponse?.meals.first?.strMeal, "Sample Meal 1")
    }

    func testFetchMealsUsingRealData() async throws {
        viewModel?.useMockData = false
        let mealResponse = try await viewModel?.fetchMeals()
        XCTAssertNotNil(mealResponse)
    }
}
