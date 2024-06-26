//
//  Constants.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/18/24.
//

import Foundation

struct Constants {
    static let usersURL = "https://jsonplaceholder.typicode.com/users"
    static let personURL = "https://swapi.py4e.com/api/people/1"
    static let videoURL = "https://gist.githubusercontent.com/dbackeus/484315/raw/dfeb530f9619bb74af5d537280a0b3b305410d01/videos.json"
    static let newsURL = "https://gist.githubusercontent.com/congsun/600f3ad57298f9dbc23fedf6b2b25450/raw/73d7a8ed589652339ae3646d0a595298ce5e72c2/newsFeed.json"
    static let mealURL = "https://www.themealdb.com/api/json/v1/1/search.php?f=s"
}

struct ErrorMsg{
    static let invalidURL = "Invalid URL"
    static let noDataFound = "No Data Found"
    static let fetchDataFailed = "Fetching Data Failed"
}

struct TableCells{
    static let personCell = "PersonCell"
    static let userCell = "UserCell"
    static let videoCell = "VideoCell"
    static let newsCell = "NewsCell"
    static let mealCell = "MealCell"
}

struct Defaults{
    static let less = "Less"
    static let more = "More"
}

struct VC {
    static let settings = "SettingsViewController"
}

