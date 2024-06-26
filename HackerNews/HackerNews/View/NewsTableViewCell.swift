//
//  NewsTableViewCell.swift
//  HackerNews
//
//  Created by Chinmay Ashtikar on 6/25/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
