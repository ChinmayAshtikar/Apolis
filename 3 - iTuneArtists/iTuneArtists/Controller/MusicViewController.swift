//
//  ViewController.swift
//  iTuneArtists
//
//  Created by Chinmay Ashtikar on 6/12/24.
//

import UIKit

class MusicViewController: UIViewController, MusicDataViewModelDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var appTable: UITableView!
    
    var artistsArr: [Artist] = []
    var viewModel = MusicDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appTable.dataSource = self
        setNavTitle()
        viewModel.delegate = self
        loadData()
    }
}


extension MusicViewController{
    
    func didFetchData() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.appTable.reloadData()
        }
    }
    
    func didShowError(_ error: Error) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
        
        func loadData() {
            activityIndicator.startAnimating()
            viewModel.fetchData()
        }
        
        func refreshTable() {
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.appTable.reloadData()
            }
        }
        
        func showError(_ error: Error) {
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        func setNavTitle() {
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
}

extension MusicViewController: UITableViewDataSource {
    // MARK: - Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.artists.count
    }
    // MARK: - Cell for Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTable.musicTableCellIdentifer.rawValue, for: indexPath) as? MusicTableViewCell else {
            return UITableViewCell()
        }
        let artist = viewModel.artists[indexPath.row]
        cell.nameLabel?.text = artist.artistName
        cell.detailLabel?.text = "\(artist.country) - \(artist.primaryGenreName)"
        cell.priceLabel?.text = "$\(artist.collectionPrice)"
        if let imageUrl = artist.artworkUrl100 {
            viewModel.fetchImage(urlString: imageUrl) { data in
                guard let imageData = data else { return }
                DispatchQueue.main.async {
                    cell.musicImage.image = UIImage(data: imageData)
                }
            }
        }
        return cell
    }
}
