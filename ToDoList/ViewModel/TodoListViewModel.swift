//
//  TodoListViewModel.swift
//  ToDoList
//
//  Created by Charles on 12/06/2025.
//

import SwiftUI

@Observable
class TodoListViewModel {
    // MARK: - Properties
    var todoList: [TodoItem] = [
        TodoItem(todo: "Buy milk", priority: .optional),
        TodoItem(todo: "Learn SwiftUI", priority: .normal),
        TodoItem(todo: "Job", priority: .urgent),
        TodoItem(todo: "Stay at home", priority: .urgent),
    ]
    
    var todoItemToEdit: TodoItem?
    var showAddTodoSheet = false
    
    // MARK: - Todo Management
    func submitTodo(todo: TodoItem) {
        if let todoToEdit = todoItemToEdit {
            updateTodo(todoToEdit: todoToEdit, todoToUpdate: todo)
        } else {
            addTodo(todoToAdd: todo)
        }
    }
    
    func addTodo(todoToAdd: TodoItem) {
        guard !todoToAdd.todo.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        todoList.append(todoToAdd)
    }
    
    func updateTodo(todoToEdit: TodoItem,
                    todoToUpdate: TodoItem) {
        guard let index = todoList.firstIndex(of: todoToEdit) else { return }
        todoList[index] = todoToUpdate
    }
    
    func deleteTodo(at offsets: IndexSet) {
        todoList.remove(atOffsets: offsets)
    }
    
    // MARK: - Sheet Management
    func showEditSheet(for todo: TodoItem) {
        todoItemToEdit = todo
    }
    
    func showAddSheet() {
        todoItemToEdit = nil
        showAddTodoSheet = true
    }
    
    func dismissEditSheet() {
        todoItemToEdit = nil
    }
    
    func dismissAddSheet() {
        showAddTodoSheet = false
    }
    
    // MARK: - Validation
    func validateTodoTitle(_ title: String) -> (isValid: Bool, message: String?) {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedTitle.isEmpty {
            return (false, "Todo title cannot be empty.")
        }
        
        if trimmedTitle.count < 2 {
            return (false, "Title must be at least 2 characters long.")
        }
        
        return (true, nil)
    }
}
