//
//  SettingsViewController.swift
//  FoodApp
//
//  Created by Chinmay Ashtikar on 6/24/24.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var networkSwitch: UISwitch!
    weak var delegate: SettingsDelegate?

        private var settingsViewModel = SettingsViewModel()

        override func viewDidLoad() {
            super.viewDidLoad()
            networkSwitch.isOn = !settingsViewModel.useMockData

            networkSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            setupDoneButton()
        }

        @objc func switchChanged(_ sender: UISwitch) {
            let useMockData = !sender.isOn
            settingsViewModel.useMockData = useMockData
            delegate?.didChangeNetworkSetting(useMockData: useMockData)
        }

        private func setupDoneButton() {
            let doneButton = UIButton(type: .system)
            doneButton.setTitle("Done", for: .normal)
            doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
            doneButton.frame = CGRect(x: view.frame.width - 76, y: 50, width: 60, height: 30)
            view.addSubview(doneButton)
        }

        @objc func doneButtonTapped() {
            let useMockData = !networkSwitch.isOn
            settingsViewModel.useMockData = useMockData
            delegate?.didChangeNetworkSetting(useMockData: useMockData)
            dismiss(animated: true, completion: nil)
        }
    }
