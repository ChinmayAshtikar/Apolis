//
//  MealTableViewCell.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/19/24.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealInstructionsLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var mealImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with meal: Meal) {
        mealNameLabel.text = meal.strMeal
        mealInstructionsLabel.text = meal.strInstructions
        
        if let imageUrl = URL(string: meal.strMealThumb) {
            loadImage(from: imageUrl)
        } else {
            mealImageView.image = UIImage(systemName: "photo")
        }
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.mealImageView.image = UIImage(data: data)
            }
        }.resume()
    }
}
