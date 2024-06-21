//
//  MealViewModel.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/19/24.
//

import Foundation

import Foundation

class MealViewModel {
    private var mealResponse: MealResponse?
    weak var delegate: DataPassDelegate?
    
    func fetchMeals() async throws -> MealResponse? {
        let urlString = Constants.mealURL
        let result = try await NetworkAPIManager.shared.fetchData(for: MealResponse.self, url: urlString)
        if let result = result {
            self.mealResponse = result
            return result
        }
        return nil
    }
    
    func getMeals() -> [Meal] {
        return mealResponse?.meals ?? []
    }

    
//    func fetchMeals() {
//        let urlString = Constants.mealURL
//        NetworkAPIManager.shared.fetchData(urlString) { (result: Result<MealResponse, Error>) in
//            switch result {
//            case .success(let mealResponse):
//                DispatchQueue.main.async {
//                    self.mealResponse = mealResponse
//                    //print("\(mealResponse)")
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
//    func getMeals() -> [Meal] {
//        return mealResponse?.meals ?? []
//    }
}
