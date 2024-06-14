//
//  PropertyCollectionCell.swift
//  RentAppUI
//
//  Created by Chinmay Ashtikar on 6/6/24.
//

import UIKit

class PropertyCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    
    override func awakeFromNib() {
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
