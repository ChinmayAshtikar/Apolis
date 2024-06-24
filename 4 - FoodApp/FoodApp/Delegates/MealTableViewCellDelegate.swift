//
//  MealTableViewCellDelegate.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/21/24.
//

import Foundation

protocol MealTableViewCellDelegate: AnyObject {
    func didTapMoreButton(on cell: MealTableViewCell)
}
