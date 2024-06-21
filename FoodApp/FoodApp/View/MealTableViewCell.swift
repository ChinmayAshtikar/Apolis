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
    @IBOutlet weak var mealStackView: UIStackView!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealStackViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var mealInstructionsHeightConstraint: NSLayoutConstraint!
    
    weak var delegate: MealTableViewCellDelegate?
    private var isExpanded: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with meal: Meal, isExpanded: Bool) {
        mealNameLabel.text = meal.strMeal
        mealInstructionsLabel.text = meal.strInstructions
        
        if let imageUrl = URL(string: meal.strMealThumb) {
            loadImage(from: imageUrl)
        } else {
            mealImageView.image = UIImage(systemName: "photo")
        }
        
        self.isExpanded = isExpanded
        updateUI()
    }
    
    @IBAction func moreButtonPressed(_ sender: Any) {
        isExpanded.toggle()
        updateUI()
        delegate?.didTapMoreButton(on: self)
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.mealImageView.image = UIImage(data: data)
            }
        }.resume()
    }
    
    private func updateUI() {
        if isExpanded {
            mealInstructionsLabel.numberOfLines = 0
            let fullHeight = mealInstructionsLabel.sizeThatFits(CGSize(width: mealInstructionsLabel.frame.width, height: CGFloat.greatestFiniteMagnitude)).height
            mealInstructionsHeightConstraint.constant = fullHeight
            mealStackViewHeightConstraint.constant = fullHeight + 81
            moreButton.setTitle(Defaults.less, for: .normal)
        } else {
            mealInstructionsLabel.numberOfLines = 3
            mealInstructionsHeightConstraint.constant = mealInstructionsLabel.font.lineHeight * 3
            mealStackViewHeightConstraint.constant = mealInstructionsLabel.font.lineHeight * 3 + 91
            moreButton.setTitle(Defaults.more, for: .normal)
        }
    }
}
