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
    
    func fetchUsers() async throws -> [User]? {
        let urlString = Constants.usersURL
        let result = try await NetworkAPIManager.shared.fetchData(for: [User].self, url: urlString)
        if let result = result {
            self.users = result
            return result
        }
        return []
    }
    
    func getUsers() -> [User] {
        return users
    }
}



//func fetchUsers() {
//    let urlString = Constants.usersURL
//    NetworkAPIManager.shared.fetchData(urlString) { (result: Result<[User], Error>) in
//        switch result {
//        case .success(let users):
//            DispatchQueue.main.async {
//                self.users = users
//                self.delegate?.didFetchData()
//            }
//        case .failure(let error):
//            DispatchQueue.main.async {
//                self.delegate?.didNotFetchData(error: error)
//            }
//        }
//    }
//}
