//
//  MockAPIManager.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/24/24.
//

import Foundation

class MockAPIManager {
    static let shared = MockAPIManager()

    func fetchData<T: Decodable>(for type: T.Type, url: String) async throws -> T? {
        if type == [User].self {
            let mockUsers = [
                User(id: 1, name: "John Doe", username: "johndoe", email: "john@example.com", address: Address(street: "123 Main St", suite: "Apt1", city: "New York", zipcode: "10001", geo: Geo(lat: "0", lng: "0")), phone: "123-456-7890", website: "johndoe.com", company: Company(name: "Doe Inc.", catchPhrase: "Hello", bs: "business")),
                User(id: 2, name: "Jane Smith", username: "janesmith", email: "jane@example.com", address: Address(street: "456 Elm St", suite: "Suite1", city: "San Francisco", zipcode: "10002", geo: Geo(lat: "1", lng: "1")), phone: "012-341-5666", website: "janesmith.com", company: Company(name: "Smith LLC", catchPhrase: "Hello", bs: "business"))
            ]

            let data = try JSONEncoder().encode(mockUsers)
            return try JSONDecoder().decode(T.self, from: data)
        } else if type == Person.self {
            let mockPerson = Person(name: "Chinmay Ashtikar", height: "200", birth_year: "19BBY", gender: "male", created: "2023-06-18T10:00:00.000Z")

            let data = try JSONEncoder().encode(mockPerson)
            return try JSONDecoder().decode(T.self, from: data)
        } else if type == [VideoResponse].self {
            let mockVideos = [
                VideoResponse(title: "Sample Video 1", created_at: "2023-06-18T10:00:00.000Z", transcodings: [
                    Transcoding(id: "1", title: "360p", height: 360),
                    Transcoding(id: "2", title: "720p", height: 720)
                ]),
                VideoResponse(title: "Sample Video 2", created_at: "2023-06-19T10:00:00.000Z", transcodings: [
                    Transcoding(id: "3", title: "480p", height: 480),
                    Transcoding(id: "4", title: "1080p", height: 1080)
                ])
            ]

            let data = try JSONEncoder().encode(mockVideos)
            return try JSONDecoder().decode(T.self, from: data)
        } else if type == MealResponse.self {
            let mockMeals = [
                Meal(strMeal: "Sample Meal 1", strInstructions: "Instructions for Sample Meal 1", strMealThumb: "https://example.com/meal1.jpg"),
                Meal(strMeal: "Sample Meal 2", strInstructions: "Instructions for Sample Meal 2", strMealThumb: "https://example.com/meal2.jpg")
            ]

            let mockMealResponse = MealResponse(meals: mockMeals)
            let data = try JSONEncoder().encode(mockMealResponse)
            return try JSONDecoder().decode(T.self, from: data)
        }
        return nil
    }
}
