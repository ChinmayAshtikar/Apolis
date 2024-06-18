//
//  ViewController.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/18/24.
//Question 1: Parse all information and show in UI
//
//https://jsonplaceholder.typicode.com/users
//
//Question 2 : Parse single user information and show in multiple UIlabel   (DATE Format:"yyyy-MM-dd'T'HH:mm:ss.SSSZ" )
//https://swapi.py4e.com/api/people/1
//
//Question 3 : https://gist.githubusercontent.com/dbackeus/484315/raw/dfeb530f9619bb74af5d537280a0b3b305410d01/videos.json
//
//Question 4 :https://gist.githubusercontent.com/congsun/600f3ad57298f9dbc23fedf6b2b25450/raw/73d7a8ed589652339ae3646d0a595298ce5e72c2/newsFeed.json
//
//Question 5: https://www.themealdb.com/api/json/v1/1/search.php?f=s

import UIKit

class UserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var userTable: UITableView!
    
    private var viewModel = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        userTable.dataSource = self
        userTable.delegate = self

        viewModel.fetchUsers {
            self.userTable.reloadData()
        }
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let user = viewModel.users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        return cell
    }
}

