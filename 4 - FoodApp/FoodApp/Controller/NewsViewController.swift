//https://gist.githubusercontent.com/congsun/600f3ad57298f9dbc23fedf6b2b25450/raw/73d7a8ed589652339ae3646d0a595298ce5e72c2/newsFeed.json
//
//  NewsViewController.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/19/24.
//

import UIKit

class NewsViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var settingsButton: UIImageView!
    @IBOutlet weak var newsTable: UITableView!
    @IBOutlet weak var loadingNews: UIActivityIndicatorView!
    
    private var newsViewModel = NewsViewModel()
    private var articles = [Article]()
    weak var userViewController: UserViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTable.dataSource = self
        newsTable.delegate = self
        loadingNews.hidesWhenStopped = true
        
        newsViewModel.delegate = self
        startLoadingData()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(settingsButtonTapped))
        settingsButton.isUserInteractionEnabled = true
        settingsButton.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func settingsButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let settingsVC = storyboard.instantiateViewController(withIdentifier: VC.settings) as! SettingsViewController
        settingsVC.modalPresentationStyle = .fullScreen
        settingsVC.delegate = userViewController
        present(settingsVC, animated: true, completion: nil)
    }
}

// Helper Functions
extension NewsViewController {
    func startLoadingData() {
        loadingNews.startAnimating()
        Task {
            do {
                if let fetchedNews = try await newsViewModel.fetchNews() {
                    self.articles = newsViewModel.getArticles()
                    newsTable.reloadData()
                }
                loadingNews.stopAnimating()
            } catch {
                loadingNews.stopAnimating()
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

// UITableViewDataSource
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsViewModel.getArticles().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.newsCell, for: indexPath) as! NewsTableViewCell
        let article = newsViewModel.getArticles()[indexPath.row]
        cell.configure(with: article)
        return cell
    }
}

// UITableViewDelegate
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! NewsTableViewCell
        if let urlString = cell.getArticleURL(), let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

// DataPassDelegate
extension NewsViewController: DataPassDelegate {
    func didFetchData() {
        newsTable.reloadData()
        loadingNews.stopAnimating()
    }
    
    func didNotFetchData(error: Error) {
        loadingNews.stopAnimating()
        print("Failed to fetch data: \(error.localizedDescription)")
    }
}
