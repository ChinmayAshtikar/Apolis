//
//  UserViewModel.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/18/24.
//

import Foundation

class UserViewModel {
    private var users: [User] = []
    weak var delegate: DataPassDelegate?
    
    func fetchUsers() {
        let urlString = Constants.usersURL
        NetworkAPIManager.shared.fetchData(urlString) { (result: Result<[User], Error>) in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                    self.delegate?.didFetchData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.delegate?.didNotFetchData(error: error)
                }
            }
        }
    }
    
    func getUsers() -> [User] {
        return users
    }
}
