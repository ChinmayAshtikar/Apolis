//
//  SubItemsListViewCell.swift
//  ToDoAppLists
//
//  Created by Chinmay Ashtikar on 6/10/24.
//

import UIKit

class SubItemsListViewCell: UITableViewCell {

    @IBOutlet weak var subItemsNameLabel: UILabel!
    @IBOutlet weak var checkMarkImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
