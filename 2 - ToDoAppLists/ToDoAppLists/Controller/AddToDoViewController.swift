//
//  AddToDoViewController.swift
//  ToDoAppLists
//
//  Created by Chinmay Ashtikar on 6/10/24.


import UIKit

class AddToDoViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var iconPreviewImage: UIImageView!

    var delegate: AddTodoProtocol?
    var checklistIcon: ToDoListIcon = .none

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension AddToDoViewController {
    private func setupUI() {
        self.navigationItem.title = "Add Checklist"

        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.leftBarButtonItem = cancelButton

        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        self.navigationItem.rightBarButtonItem = doneButton

        containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(chooseIconTapped)))
        containerView.isUserInteractionEnabled = true
    }

    @objc func chooseIconTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let chooseIconViewController = storyboard.instantiateViewController(withIdentifier: "IconViewController") as? IconViewController else {
            fatalError()
        }
        chooseIconViewController.delegate = self
        self.navigationController?.pushViewController(chooseIconViewController, animated: true)
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
        delegate?.addChecklist(TodoList(name: nameTextFieldValue, icon: checklistIcon, todoSubitem: []))
        self.navigationController?.popViewController(animated: true)
    }
}

extension AddToDoViewController: TodoIconProtocol {
    func setIconPreviewImage(_ checklist: ToDoListIcon = .none) {
        checklistIcon = checklist
        iconPreviewImage.image = checklist.image
    }
}




