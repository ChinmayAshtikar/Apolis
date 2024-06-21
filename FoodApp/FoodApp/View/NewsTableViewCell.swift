//
//  NewsTableViewCell.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/19/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with article: Article) {
        titleLabel.text = article.title
        authorLabel.text = article.author ?? "N/A"
        sourceLabel.text = article.source.name
        
        if let imageUrlString = article.urlToImage, let imageUrl = URL(string: imageUrlString) {
            loadImage(from: imageUrl)
        } else {
            articleImageView.image = UIImage(systemName: "photo")
        }
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.articleImageView.image = UIImage(data: data)
            }
        }.resume()
    }
}
