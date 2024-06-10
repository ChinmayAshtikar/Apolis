//
//  LoginViewController.swift
//  RentAppUI
//
//  Created by Chinmay Ashtikar on 6/6/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var termsLabel: UILabel!
    @IBOutlet weak var emailBorder: UILabel!
    @IBOutlet weak var appleBorder: UILabel!
    @IBOutlet weak var googleBorder: UILabel!
    @IBOutlet weak var facebookBorder: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
    }
    
    func displayData(){
        emailBorder.layer.cornerRadius = 10
        emailBorder.backgroundColor = .white
        emailBorder.layer.masksToBounds = true
        emailBorder.layer.borderWidth = 0.5
        emailBorder.layer.borderColor = UIColor.lightGray.cgColor
        
        
        appleBorder.layer.cornerRadius = 10
        appleBorder.backgroundColor = .white
        appleBorder.layer.masksToBounds = true
        appleBorder.layer.borderWidth = 0.5
        appleBorder.layer.borderColor = UIColor.lightGray.cgColor
        
        googleBorder.layer.cornerRadius = 10
        googleBorder.backgroundColor = .white
        googleBorder.layer.masksToBounds = true
        googleBorder.layer.borderWidth = 0.5
        googleBorder.layer.borderColor = UIColor.lightGray.cgColor
        
        facebookBorder.layer.cornerRadius = 10
        facebookBorder.backgroundColor = .white
        facebookBorder.layer.masksToBounds = true
        facebookBorder.layer.borderWidth = 0.5
        facebookBorder.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func crossButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
