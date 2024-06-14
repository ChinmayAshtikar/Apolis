//
//  AddSubItemsViewController.swift
//  ToDoAppLists
//
//  Created by Chinmay Ashtikar on 6/10/24.
//

import UIKit

class AddSubItemsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var setReminderSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!

    var delegate: AddSubItemProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension AddSubItemsViewController {
    private func setupUI() {
        self.navigationItem.title = "Add Item"
    
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.leftBarButtonItem = cancelButton

        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        self.navigationItem.rightBarButtonItem = doneButton
    }

    @objc func cancelButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonTapped() {
        guard let nameTextFieldValue = nameTextField.text,
        nameTextFieldValue != "" else {
            let alert = UIAlertController(title: "Invalid Name", message: "Please enter valid checklist name!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        delegate?.addChecklistItem(ToDoSubItem(name: nameTextFieldValue, isComplete: false, dueDate: datePicker.date, shouldRemind: setReminderSwitch.isOn))
        self.navigationController?.popViewController(animated: true)
    }
}


