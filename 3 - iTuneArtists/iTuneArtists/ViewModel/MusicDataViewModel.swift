//
//  MusicDataViewModel.swift
//  iTuneArtists
//
//  Created by Chinmay Ashtikar on 6/14/24.
//
//

import Foundation

protocol MusicDataViewModelDelegate: AnyObject {
    func didFetchData()
    func didShowError(_ error: Error)
}

class MusicDataViewModel {
    var artists: [Artist] = []
    weak var delegate: MusicDataViewModelDelegate?
    
    func fetchData() {
        NetworkAPIManager.shared.fetchArtists { [weak self] data, error in
            if let error = error {
                self?.delegate?.didShowError(error)
                return
            }
            if let data = data {
                self?.artists = data
                self?.delegate?.didFetchData()
            }
        }
    }
//    func fetchData(){
//        NetworkAPIManager.shared.fetchArtists()
//    }
    
    func fetchImage(urlString: String, completion: @escaping (Data?) -> Void) {
        NetworkAPIManager.shared.fetchImage(urlString: urlString, completion: completion)
    }
}
