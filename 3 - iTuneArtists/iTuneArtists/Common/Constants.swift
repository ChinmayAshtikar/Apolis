//
//  Constants.swift
//  iTuneArtists
//
//  Created by Chinmay Ashtikar on 6/12/24.
//

import Foundation

enum Constants: String {
    case artistURL = "https://itunes.apple.com/search?term=a"
}

enum ServerError: String {
    case apiError = "Failed to decode JSON"
}

enum MusicTable: String {
    case musicTableCellIdentifer = "musicCell"
    
}
