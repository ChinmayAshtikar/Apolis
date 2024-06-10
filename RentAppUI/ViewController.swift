//
//  ViewController.swift
//  RentAppUI
//
//  Created by Chinmay Ashtikar on 6/6/24.
//

import UIKit

struct Property{
    let title: String
    let logoName: String
    
}

struct RentDisplay{
    let roomPic: String
    let price: String
    let size: String
    let address: String
    
}


class ViewController: UIViewController {

    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var getStartedLabel: UILabel!
    @IBOutlet weak var rentDisplayCollection: UICollectionView!
    @IBOutlet weak var propertyCollection: UICollectionView!
    let properties = [Property(title: "Property for Rent", logoName: "apartment"),
                       Property(title: "Property for Sale", logoName: "sale"),
                       Property(title: "Off-Plan Properties", logoName: "offplan"),
                       Property(title: "Rooms for Rent", logoName: "rent"),
                       Property(title: "Motors for Rent", logoName: "motor"),
                       Property(title: "Apply for Jobs", logoName: "job"),
                       Property(title: "View Classifieds", logoName: "classified"),
                       Property(title: "Furniture & Garden", logoName: "furniture"),
                       Property(title: "See Community", logoName: "community")]
    
    
    let rentDisplayArr = [RentDisplay(roomPic: "room1", price: "AED 20,000", size: "1 Bed . 2 Baths", address: "Paradise Lakes"),
                          RentDisplay(roomPic: "room2", price: "AED 175,000", size: "3 Bed . 3 Baths", address: "Arabella 3, Arabella"),
                          RentDisplay(roomPic: "room3", price: "AED 26,000", size: "2 Bed . 1 Bath", address: "Araphoe Avenue"),
                          RentDisplay(roomPic: "room4", price: "AED 100,000", size: "2 Bed . 2 Baths", address: "Bucknam Street")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBarSetup()
        collctionViewSetup()
        getStartedSetup()
    }
    
    func searchBarSetup() {
        searchLabel.layer.cornerRadius = 25
        searchLabel.layer.borderColor = UIColor.lightGray.cgColor
        searchLabel.layer.borderWidth = 0.3
        searchLabel.backgroundColor = .white
        
        textField.borderStyle = .none
        
    }
    
    func collctionViewSetup(){
        propertyCollection.dataSource = self
        propertyCollection.delegate = self
        rentDisplayCollection.dataSource = self
    }
    
    func getStartedSetup(){
        
        getStartedLabel.layer.cornerRadius = 10
        getStartedLabel.layer.borderColor = UIColor.lightGray.cgColor
        getStartedLabel.layer.borderWidth = 0.3
        getStartedLabel.backgroundColor = .white
        getStartedLabel.shadowColor = .black
    }
    
    


}


extension ViewController: UICollectionViewDataSource,  UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == propertyCollection {
            return properties.count
        } else if collectionView == rentDisplayCollection {
            return rentDisplayArr.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           if collectionView == propertyCollection {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "propertyCell", for: indexPath) as! PropertyCollectionCell
               let property = properties[indexPath.item]
               cell.logo.image = UIImage(named: property.logoName)
               cell.title.text = property.title
               return cell
           } else if collectionView == rentDisplayCollection {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rentCell", for: indexPath) as! RentCollectionCell
               let rentDisplay = rentDisplayArr[indexPath.item]
               cell.propertyImage.image = UIImage(named: rentDisplay.roomPic)
               cell.priceLabel.text = rentDisplay.price
               cell.roomSizeLabel.text = rentDisplay.size
               cell.addressLabel.text = rentDisplay.address
               return cell
           }
           return UICollectionViewCell()
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == propertyCollection {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
                loginViewController.modalPresentationStyle = .fullScreen
                self.present(loginViewController, animated: true, completion: nil)
            }
        }
    }
}

