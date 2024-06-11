//
//  UpdateTodoProtocol.swift
//  ToDoAppLists
//
//  Created by Chinmay Ashtikar on 6/10/24.
//

import Foundation

protocol UpdateTodoProtocol {
    func updateChecklistItems(_ todosubitems: [ToDoSubItem], _ index: Int)
}
