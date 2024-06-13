//
//  MusicData.swift
//  iTuneArtists
//
//  Created by Chinmay Ashtikar on 6/12/24.
//

import Foundation

struct SearchResponse: Codable {
    let results: [Artist]
}

struct Artist: Codable {
    let artistName: String
    let country: String
    let primaryGenreName: String
    let collectionPrice: Double
    let artworkUrl100: String?
}


