//
//  MealViewModel.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/19/24.
//

import Foundation

class MealViewModel {
    private var mealResponse: MealResponse?
    weak var delegate: DataPassDelegate?
    var useMockData = false
    
    func fetchMeals() async throws -> MealResponse? {
        let urlString = Constants.mealURL
        if useMockData {
            let result = try await MockAPIManager.shared.fetchData(for: MealResponse.self, url: urlString)
            if let result = result {
                self.mealResponse = result
                return result
            }
        } else {
            let result = try await NetworkAPIManager.shared.fetchData(for: MealResponse.self, url: urlString)
            if let result = result {
                self.mealResponse = result
                return result
            }
        }
        return nil
    }
    
    func getMeals() -> [Meal] {
        return mealResponse?.meals ?? []
    }
}
