//
//  UserDataDelegate.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/19/24.
//

import Foundation

protocol DataPassDelegate: AnyObject {
    func didFetchData()
    func didNotFetchData(error: Error)
}
