//
//  ViewController.swift
//  HackerNews
//
//  Created by Chinmay Ashtikar on 6/25/24.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsTable: UITableView!
    private let newsViewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTable.dataSource = self
        newsTable.delegate = self
        
        fetchNewsData()
    }
    
    private func fetchNewsData() {
        newsViewModel.fetchNews { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success():
                    self?.newsTable.reloadData()
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
            }
        }
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsViewModel.getNewsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        
        if let newsItem = newsViewModel.newsItem(at: indexPath.row) {
            cell.authorLabel.text = newsItem.title
            cell.commentsLabel.text = "\(newsItem.num_comments) comments"
            cell.pointsLabel.text = "\(newsItem.points) points"
            cell.titleLabel.text = "Written by \(newsItem.author)"
           // cell.urlLabel.text = newsItem.url
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let newsItem = newsViewModel.newsItem(at: indexPath.row),
           let urlString = newsItem.url,
           let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}
