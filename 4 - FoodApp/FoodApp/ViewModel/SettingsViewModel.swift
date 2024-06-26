//
//  SettingsViewModel.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/25/24.
//

import Foundation

class SettingsViewModel {
    var useMockData: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "useMockData")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "useMockData")
        }
    }

    func toggleMockData() {
        useMockData = !useMockData
    }
}
