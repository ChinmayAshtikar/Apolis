//
//  MealViewController.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/19/24.
//

import UIKit

class MealViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var mealTable: UITableView!
    @IBOutlet weak var loadingMeal: UIActivityIndicatorView!
    
    private var mealViewModel = MealViewModel()
    private var meals = [Meal]()
    private var expandedStates = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealTable.dataSource = self
        mealTable.delegate = self
        loadingMeal.hidesWhenStopped = true
        
        startLoadingData()
    }
}

// Helper Functions
extension MealViewController {
    func startLoadingData() {
        loadingMeal.startAnimating()
        Task {
            do {
                if let fetchedMealResponse = try await mealViewModel.fetchMeals() {
                    self.meals = fetchedMealResponse.meals
                    self.expandedStates = Array(repeating: false, count: self.meals.count)
                    mealTable.reloadData()
                }
                loadingMeal.stopAnimating()
            } catch {
                loadingMeal.stopAnimating()
                print("\(error.localizedDescription)")
            }
        }
    }
}


// UITableViewDataSource
extension MealViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.mealCell, for: indexPath) as! MealTableViewCell
        let meal = meals[indexPath.row]
        let isExpanded = expandedStates[indexPath.row]
        cell.configure(with: meal, isExpanded: isExpanded)
        cell.delegate = self
        return cell
    }
}

// UITableViewDelegate
extension MealViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return expandedStates[indexPath.row] ? 500 : UITableView.automaticDimension
    }
}

// MealTableViewCellDelegate
extension MealViewController: MealTableViewCellDelegate {
    func didTapMoreButton(on cell: MealTableViewCell) {
        if let indexPath = mealTable.indexPath(for: cell) {
            expandedStates[indexPath.row].toggle()
            mealTable.beginUpdates()
            mealTable.endUpdates()
        }
    }
}

//// Helper Functions
//extension MealViewController {
//    func startLoadingData() {
//        loadingMeal.startAnimating()
//        Task {
//            do {
//                if let fetchedMeals = try await mealViewModel.fetchMeals() {
//                    self.meals = mealViewModel.getMeals()
//                    mealTable.reloadData()
//                }
//                loadingMeal.stopAnimating()
//            } catch {
//                loadingMeal.stopAnimating()
//                print("Error: \(error.localizedDescription)")
//            }
//        }
//    }
//}
//
//// UITableViewDataSource
//extension MealViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return mealViewModel.getMeals().count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.mealCell, for: indexPath) as! MealTableViewCell
//        let meal = mealViewModel.getMeals()[indexPath.row]
//        cell.configure(with: meal)
//        cell.delegate = self
//        return cell
//    }
//}
//extension MealViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let meal = meals[indexPath.row]
//        return meal.isExpanded ? 500 : UITableView.automaticDimension
//    }
//}
//
//// MealTableViewCellDelegate
//extension MealViewController: MealTableViewCellDelegate {
//    func didTapMoreButton(on cell: MealTableViewCell) {
//        if let indexPath = mealTable.indexPath(for: cell) {
//            mealTable.beginUpdates()
//            mealTable.endUpdates()
//        }
//    }
//}
//
//
//// DataPassDelegate
//extension MealViewController: DataPassDelegate {
//    func didFetchData() {
//        mealTable.reloadData()
//        loadingMeal.stopAnimating()
//    }
//
//    func didNotFetchData(error: Error) {
//        loadingMeal.stopAnimating()
//        print("\(error.localizedDescription)")
//    }
//}
