//
//  MusicTableViewCell.swift
//  iTuneArtists
//
//  Created by Chinmay Ashtikar on 6/12/24.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupPriceLabel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupPriceLabel(){
        priceLabel.layer.borderColor = UIColor.blue.cgColor
        priceLabel.layer.borderWidth = 1.0
        priceLabel.layer.cornerRadius = 5.0
        priceLabel.layer.masksToBounds = true
        let separator = UIView(frame: CGRect(x: 15, y: self.frame.size.height - 0.5, width: self.frame.size.width - 30, height: 0.5))
        separator.backgroundColor = UIColor.lightGray
        separator.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        self.addSubview(separator)
    }

}
