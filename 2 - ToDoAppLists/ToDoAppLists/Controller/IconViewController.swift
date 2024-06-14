//
//  IconViewController.swift
//  ToDoAppLists
//
//  Created by Chinmay Ashtikar on 6/10/24.
//

import UIKit

class IconViewController: UIViewController {

    @IBOutlet weak var chooseIconTableView: UITableView!
    
    var icons: [ToDoListIcon] = ToDoListIcon.allCases
    var selectedIndex: Int = 0
    var delegate: TodoIconProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent {
            delegate?.setIconPreviewImage(icons[selectedIndex])
        }
        super.viewWillDisappear(animated)
    }
}

extension IconViewController {
    private func setupUI() {
        self.navigationItem.title = "Choose Icon"
        chooseIconTableView.dataSource = self
        chooseIconTableView.delegate = self
    }
}

extension IconViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseIconTableViewCell", for: indexPath) as? IconListViewCell else {
            fatalError()
        }
        cell.iconImageView.image = icons[indexPath.row].image
        cell.iconName.text = icons[indexPath.row].label
        return cell
    }
}

extension IconViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        delegate?.setIconPreviewImage(icons[selectedIndex])
        self.navigationController?.popViewController(animated: true)
    }
}
