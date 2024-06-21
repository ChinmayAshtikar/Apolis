//
//  UserViewController.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/18/24.
//
//Question 1: Parse all information and show in UI
//https://jsonplaceholder.typicode.com/users


import UIKit

class UserViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var loadingUser: UIActivityIndicatorView!
    @IBOutlet weak var userTable: UITableView!
    
    private var userViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTable.dataSource = self
        loadingUser.hidesWhenStopped = true
        
        userViewModel.delegate = self
        startLoadingData()
    }
}

// Helper Functions
extension UserViewController {
    func startLoadingData() {
        loadingUser.startAnimating()
        userViewModel.fetchUsers()
    }
}

// UITableViewDataSource
extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.getUsers().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.userCell, for: indexPath) as! UserTableViewCell
        let user = userViewModel.getUsers()[indexPath.row]
        cell.configure(with: user)
        return cell
    }
}

// UserDataDelegate
extension UserViewController: DataPassDelegate {
    func didFetchData() {
        userTable.reloadData()
        loadingUser.stopAnimating()
    }
    
    func didNotFetchData(error: Error) {
        loadingUser.stopAnimating()
        print(ErrorMsg.fetchDataFailed)
    }
}
