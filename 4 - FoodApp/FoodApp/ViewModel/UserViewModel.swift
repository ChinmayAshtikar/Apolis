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
    var useMockData = false
    
    func fetchUsers() async throws -> [User]? {
        let urlString = Constants.usersURL
        if useMockData {
            let result = try await MockAPIManager.shared.fetchData(for: [User].self, url: urlString)
            if let result = result {
                self.users = result
                return result
            }
        } else {
            let result = try await NetworkAPIManager.shared.fetchData(for: [User].self, url: urlString)
            if let result = result {
                self.users = result
                return result
            }
        }
        return []
    }
    
    func getUsers() -> [User] {
        return users
    }
}



//class UserViewModel {
//    private var users: [User] = []
//    weak var delegate: DataPassDelegate?
//
//    func fetchUsers() async throws -> [User]? {
//        let urlString = Constants.usersURL
//        let result = try await NetworkAPIManager.shared.fetchData(for: [User].self, url: urlString)
//        if let result = result {
//            self.users = result
//            return result
//        }
//        return []
//    }
//
//    func getUsers() -> [User] {
//        return users
//    }
//}
