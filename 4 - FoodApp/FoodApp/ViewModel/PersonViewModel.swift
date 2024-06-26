//
//  PersonViewModel.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/18/24.
//

import Foundation

class PersonViewModel {
    private var person: Person?
    weak var delegate: DataPassDelegate?
    var useMockData = false

    func fetchPerson() async throws -> Person? {
        let urlString = Constants.personURL
        if useMockData {
            let result = try await MockAPIManager.shared.fetchData(for: Person.self, url: urlString)
            if let result = result {
                self.person = result
                return result
            }
        } else {
            let result = try await NetworkAPIManager.shared.fetchData(for: Person.self, url: urlString)
            if let result = result {
                self.person = result
                return result
            }
        }
        return nil
    }

    func getPerson() -> [Person] {
        if let person = person {
            return [person]
        }
        return []
    }
}
