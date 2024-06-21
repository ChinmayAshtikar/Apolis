//
//  PersonViewController.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/18/24.
//
//Question 2 : Parse single user information and show in multiple UIlabel   (DATE Format:"yyyy-MM-dd'T'HH:mm:ss.SSSZ" )
//https://swapi.py4e.com/api/people/1

import UIKit

class PersonViewController: UIViewController{
    
    //Outlets
    @IBOutlet weak var personTable: UITableView!
    @IBOutlet weak var loadingPerson: UIActivityIndicatorView!
    
    private var personViewModel = PersonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
         personTable.dataSource = self
         loadingPerson.hidesWhenStopped = true
         
         personViewModel.delegate = self
         startLoadingData()
    }
}

// Helper Functions
extension PersonViewController {
    func startLoadingData() {
        loadingPerson.startAnimating()
        personViewModel.fetchPerson()
    }
}

// UITableViewDataSource
extension PersonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personViewModel.getPerson().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.personCell, for: indexPath) as! PersonTableViewCell
        let person = personViewModel.getPerson()[indexPath.row]
        cell.configure(with: person)
        return cell
    }
}

// PersonDataDelegate
extension PersonViewController: DataPassDelegate {
    func didFetchData() {
        personTable.reloadData()
        loadingPerson.stopAnimating()
    }
    
    func didNotFetchData(error: Error) {
        loadingPerson.stopAnimating()
        print(ErrorMsg.fetchDataFailed)
    }
}
