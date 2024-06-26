//
//  NetworkSettingsDelegate.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/24/24.
//

import Foundation

protocol SettingsDelegate: AnyObject {
    func didChangeNetworkSetting(useMockData: Bool)
}
