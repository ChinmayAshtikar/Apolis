//
//  RentCollectionCell.swift
//  RentAppUI
//
//  Created by Chinmay Ashtikar on 6/7/24.
//

import UIKit

class RentCollectionCell: UICollectionViewCell {
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var roomSizeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var propertyImage: UIImageView!
    
    
    override func awakeFromNib() {
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
