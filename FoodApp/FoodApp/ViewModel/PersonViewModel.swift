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
    
    func fetchPerson() {
        let urlString = Constants.personURL
        NetworkAPIManager.shared.fetchData(urlString) { (result: Result<Person, Error>) in
            switch result {
            case .success(let person):
                DispatchQueue.main.async {
                    self.person = person
                    self.delegate?.didFetchData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.delegate?.didNotFetchData(error: error)
                }
            }
        }
    }
    
    func getPerson() -> [Person] {
        if let person = person {
            return [person]
        }
        return []
    }
    
    //    func formattedDate(from dateString: String) -> String? {
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    //        guard let date = dateFormatter.date(from: dateString) else { return nil }
    //    }
}
