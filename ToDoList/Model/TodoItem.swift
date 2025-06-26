//
//  TodoItem.swift
//  ToDoList
//
//  Created by Charles on 26/06/2025.
//

import Foundation

struct TodoItem: Identifiable, Hashable {
    var id: UUID = UUID()
    var todo: String
    var priority: PriorityType
}
