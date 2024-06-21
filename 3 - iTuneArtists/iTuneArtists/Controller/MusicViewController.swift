//
//  ViewController.swift
//  iTuneArtists
//
//  Created by Chinmay Ashtikar on 6/12/24.
//

import UIKit

class MusicViewController: UIViewController, MusicDataViewModelDelegate{
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var appTable: UITableView!
    
    var viewModel = MusicDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appTable.dataSource = self
        setNavTitle()
        viewModel.delegate = self
        startProgress()
        viewModel.fetchData()
    }
    
    func didFetchData() {
        stopProgress()
    }
    
    func didShowError(_ error: Error) {
        stopProgress()
        showErrorAlert(message: error.localizedDescription)
    }
}

private extension MusicViewController {
    func startProgress() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func stopProgress() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.appTable.reloadData()
        }
    }
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: AlertProps.errorAlertTitle.rawValue, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.okButtonTitle.rawValue, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setNavTitle() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
