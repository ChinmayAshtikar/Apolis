//
//  AllSubItemsViewController.swift
//  ToDoAppLists
//
//  Created by Chinmay Ashtikar on 6/10/24.
//

import UIKit

class AllSubItemsViewController: UIViewController {

    @IBOutlet weak var todoListItemsTableView: UITableView!
    
    var checklistItems: [ToDoSubItem] = []
    var delegate: UpdateTodoProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent {
            delegate?.updateChecklistItems(checklistItems, view.tag)
        }
        super.viewWillDisappear(animated)
    }
}

extension AllSubItemsViewController {
    private func setupUI() {
        todoListItemsTableView.dataSource = self
        todoListItemsTableView.delegate = self

        let addChecklistItemButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addChecklistItemButtonTapped))
        self.navigationItem.rightBarButtonItem = addChecklistItemButton
    }

    @objc func addChecklistItemButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let addSubItemViewController = storyboard.instantiateViewController(withIdentifier: "AddSubItemsViewController") as? AddSubItemsViewController else {
            fatalError()
        }
        addSubItemViewController.delegate = self
        self.navigationController?.pushViewController(addSubItemViewController, animated: true)
    }
}

extension AllSubItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklistItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubItemTableViewCell", for: indexPath) as? SubItemsListViewCell else {
            fatalError()
        }
        cell.checkMarkImage.isHidden = !checklistItems[indexPath.row].isComplete
        cell.subItemsNameLabel.text = checklistItems[indexPath.row].name
        return cell
    }
}

extension AllSubItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        checklistItems[indexPath.row].isComplete.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension AllSubItemsViewController: AddSubItemProtocol {
    func addChecklistItem(_ checklistItem: ToDoSubItem) {
        checklistItems.append(checklistItem)
        todoListItemsTableView.reloadData()
    }
}
