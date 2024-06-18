//
//  Constants.swift
//  iTuneArtists
//
//  Created by Chinmay Ashtikar on 6/12/24.
//

import Foundation

enum URLProps: String{
    case artistURL = "https://itunes.apple.com/search?term=a"
}

enum Constants: String {
    case okButtonTitle = "OK"
}

enum AlertProps: String {
    case errorAlertTitle = "Error"
    case errorAlertMessage = "An error occurred while fetching data."
}

enum ServerMsg: String, Error {
    case apiError = "Failed to decode JSON"
}

enum MusicTable: String {
    case musicTableCellIdentifer = "musicCell"
}
