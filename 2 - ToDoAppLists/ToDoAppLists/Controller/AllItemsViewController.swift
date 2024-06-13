//
//  ViewController.swift
//  ToDoAppLists
//
//  Created by Chinmay Ashtikar on 6/10/24.
//

import UIKit

class AllItemsViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!

    var checklists: [TodoList] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension AllItemsViewController {
    private func setupUI() {
        checklists = TodoList.loadData()
        todoTableView.dataSource = self
        todoTableView.delegate = self

        let addChecklistButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addChecklistButtonTapped))
        
        self.navigationItem.rightBarButtonItem = addChecklistButton
    }
    
    @objc func addChecklistButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let addToDoViewController = storyboard.instantiateViewController(withIdentifier: "AddToDoViewController") as? AddToDoViewController else {
            fatalError()
        }
        addToDoViewController.delegate = self
        self.navigationController?.pushViewController(addToDoViewController, animated: true)
    }
}

extension AllItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklists.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableViewCell", for: indexPath) as? TodoListViewCell else {
            fatalError()
        }
        cell.iconImage2.image = checklists[indexPath.row].icon?.image
        cell.todoName.text = checklists[indexPath.row].name
        return cell
    }
}

extension AllItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "AllSubItemsViewController") as? AllSubItemsViewController else {
            fatalError()
        }
        nextViewController.checklistItems = checklists[indexPath.row].todoSubitem
        nextViewController.navigationController?.title = checklists[indexPath.row].name
        nextViewController.delegate = self
        nextViewController.view.tag = indexPath.row
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension AllItemsViewController: AddTodoProtocol, UpdateTodoProtocol {
    func addChecklist(_ checklist: TodoList) {
        checklists.append(checklist)
        todoTableView.reloadData()
    }
    func updateChecklistItems(_ checklistItems: [ToDoSubItem], _ index: Int) {
        checklists[index].todoSubitem = checklistItems
        todoTableView.reloadData()
    }
}




