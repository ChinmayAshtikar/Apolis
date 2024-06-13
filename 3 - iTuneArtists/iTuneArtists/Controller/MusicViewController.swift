//
//  ViewController.swift
//  iTuneArtists
//
//  Created by Chinmay Ashtikar on 6/12/24.
//

import UIKit

class MusicViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var appTable: UITableView!
    var artists: [Artist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appTable.dataSource = self
        fetchData()
        setNavTitle()
    }
    
    func fetchData() {
        activityIndicator.startAnimating()
        NetworkAPIManager.shared.fetchArtists { [weak self] artists in
            guard let self = self, let artists = artists else {
                DispatchQueue.main.async {
                    self?.activityIndicator.stopAnimating()
                }
                return
            }
            self.artists = artists
            refreshTable()
        }
    }
    
    func refreshTable(){
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.appTable.reloadData()
        }
    }
    
    func setNavTitle(){
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

extension MusicViewController: UITableViewDataSource {
    // MARK: - Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    // MARK: - Cell for Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTable.musicTableCellIdentifer.rawValue, for: indexPath) as? MusicTableViewCell else {
            return UITableViewCell()
        }
        let artist = artists[indexPath.row]
        cell.nameLabel?.text = artist.artistName
        cell.detailLabel?.text = "\(artist.country) - \(artist.primaryGenreName)"
        cell.priceLabel?.text = "$\(artist.collectionPrice)"
        if let imageUrl = artist.artworkUrl100 {
            NetworkAPIManager.shared.fetchImage(urlString: imageUrl) { data in
                guard let imageData = data else { return }
                DispatchQueue.main.async {
                    cell.musicImage.image = UIImage(data: imageData)
                }
            }
        }
        return cell
    }
}
