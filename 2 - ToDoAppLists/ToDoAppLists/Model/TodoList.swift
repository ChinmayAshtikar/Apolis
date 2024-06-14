//
//  TodoList.swift
//  ToDoAppLists
//
//  Created by Chinmay Ashtikar on 6/10/24.
//

import UIKit

struct ToDoSubItem {
    var name: String
    var isComplete: Bool
    var dueDate: Date?
    var shouldRemind: Bool = false
}

struct TodoList {
    var name: String
    var icon: ToDoListIcon?
    var todoSubitem: [ToDoSubItem]
    
    static func loadData() -> [TodoList] {
        
        func createDate(year: Int, month: Int, day: Int) -> Date? {
            var dateComponents = DateComponents()
            dateComponents.year = year
            dateComponents.month = month
            dateComponents.day = day
            return Calendar.current.date(from: dateComponents)
        }
        
        let todoItems = [
            [
                ToDoSubItem(name: "Chinmay's birthday gift", isComplete: false, dueDate: createDate(year: 2024, month: 8, day: 20)),
                ToDoSubItem(name: "Buy birthday cake", isComplete: true, dueDate: createDate(year: 2024, month: 8, day: 18))
            ],
            [
                ToDoSubItem(name: "Doctor appointment", isComplete: false, dueDate: createDate(year: 2024, month: 7, day: 1)),
                ToDoSubItem(name: "Call home", isComplete: false, dueDate: createDate(year: 2024, month: 6, day: 12))
            ],
            [
                ToDoSubItem(name: "Finish work", isComplete: true, dueDate: createDate(year: 2024, month: 6, day: 10)),
                ToDoSubItem(name: "Clean room", isComplete: false, dueDate: nil)
            ],
            [
                ToDoSubItem(name: "Buy milk", isComplete: false, dueDate: createDate(year: 2024, month: 6, day: 15)),
                ToDoSubItem(name: "Buy eggs", isComplete: true, dueDate: nil),
                ToDoSubItem(name: "Buy bread", isComplete: false, dueDate: createDate(year: 2024, month: 6, day: 14))
            ],
            [
                ToDoSubItem(name: "Book flights", isComplete: false, dueDate: createDate(year: 2024, month: 9, day: 1)),
                ToDoSubItem(name: "Reserve hotel", isComplete: false, dueDate: createDate(year: 2024, month: 9, day: 5))
            ]
        ]
        
        return [
            TodoList(name: "Birthdays", icon: .birthday, todoSubitem: todoItems[0]),
            TodoList(name: "Business Stuff", icon: .appointment, todoSubitem: todoItems[1]),
            TodoList(name: "Chores", icon: .chore, todoSubitem: todoItems[2]),
            TodoList(name: "Groceries", icon: .grocery, todoSubitem: todoItems[3]),
            TodoList(name: "Trips", icon: .trip, todoSubitem: todoItems[4])
        ]
    }
}


enum ToDoListIcon: CaseIterable {
    case none
    case appointment
    case birthday
    case chore
    case drink
    case folder
    case grocery
    case inbox
    case photo
    case trip

    var label: String {
        switch self {
        case .none: return "No Icon"
        case .appointment: return "Appointment"
        case .birthday: return "Birthday"
        case .chore: return "Chore"
        case .drink: return "Drink"
        case .folder: return "Folder"
        case .grocery: return "Grocery"
        case .inbox: return "Inbox"
        case .photo: return "Photo"
        case .trip: return "Trip"
        }
    }

    var image: UIImage? {
        switch self {
        case .none: return nil
        case .appointment: return UIImage(systemName: "calendar")
        case .birthday: return UIImage(systemName: "gift.fill")
        case .chore: return UIImage(systemName: "house")
        case .drink: return UIImage(systemName: "mug.fill")
        case .folder: return UIImage(systemName: "folder.fill")
        case .grocery: return UIImage(systemName: "cart.fill")
        case .inbox: return UIImage(systemName: "tray.and.arrow.down.fill")
        case .photo: return UIImage(systemName: "camera.fill")
        case .trip: return UIImage(systemName: "airplane")
        }
    }
}
