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
    @IBOutlet weak var newsTable: UITableView!
    @IBOutlet weak var loadingNews: UIActivityIndicatorView!
    
    private var newsViewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTable.dataSource = self
        loadingNews.hidesWhenStopped = true
        
        newsViewModel.delegate = self
        startLoadingData()
    }
}

// Helper Functions
extension NewsViewController {
    func startLoadingData() {
        loadingNews.startAnimating()
        newsViewModel.fetchNews()
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
