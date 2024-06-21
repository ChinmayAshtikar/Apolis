//
//  UserTableViewCell.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/18/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    
    //Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
        usernameLabel.text = user.username
        phoneLabel.text = user.phone
        websiteLabel.text = user.website
        companyLabel.text = user.company.name
        addressLabel.text = "\(user.address.street), \(user.address.suite), \(user.address.city), \(user.address.zipcode)"
    }
}
