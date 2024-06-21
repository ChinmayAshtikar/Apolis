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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealTable.dataSource = self
        loadingMeal.hidesWhenStopped = true
        
        mealViewModel.delegate = self
        startLoadingData()
    }
}

// Helper Functions
extension MealViewController {
    func startLoadingData() {
        loadingMeal.startAnimating()
        mealViewModel.fetchMeals()
    }
}

// UITableViewDataSource
extension MealViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealViewModel.getMeals().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.mealCell, for: indexPath) as! MealTableViewCell
        let meal = mealViewModel.getMeals()[indexPath.row]
        cell.configure(with: meal)
        return cell
    }
}

// DataPassDelegate
extension MealViewController: DataPassDelegate {
    func didFetchData() {
        mealTable.reloadData()
        loadingMeal.stopAnimating()
    }
    
    func didNotFetchData(error: Error) {
        loadingMeal.stopAnimating()
        print("\(error.localizedDescription)")
    }
}
