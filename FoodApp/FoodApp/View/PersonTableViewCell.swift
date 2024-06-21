//
//  PersonTableViewCell.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/18/24.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with person: Person) {
        nameLabel.text = person.name
        heightLabel.text = person.height
        birthLabel.text = person.birth_year
        genderLabel.text = person.gender
        createdLabel.text = person.created
    }
}
