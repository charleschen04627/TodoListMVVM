//
//  TodoActionButtonView.swift
//  ToDoList
//
//  Created by Charles on 26/06/2025.
//

import SwiftUI

struct TodoActionButtonView: View {
    let viewModel: TodoListViewModel
    let todoItem: TodoItem
    let onSuccess: () -> Void
    let onError: (String, String) -> Void
    
    var body: some View {
        Button(action: {
            let validation = viewModel.validateTodoTitle(todoItem.todo)
            guard validation.isValid else {
                onError("Invalid Title", validation.message ?? "Unknown error")
                return
            }
            
            viewModel.submitTodo(todo: todoItem)
            onSuccess()
        }) {
            Text(viewModel.todoItemToEdit == nil ? "Create" : "Update")
                .font(.headline)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundStyle(.white)
                .background(Color.blue)
                .clipShape(Capsule())
        }
    }
}

#Preview {
    TodoActionButtonView(
        viewModel: TodoListViewModel(),
        todoItem: TodoItem(todo: "Sample todo", priority: .normal),
        onSuccess: { print("Success") },
        onError: { title, message in print("Error: \(title) - \(message)") }
    )
    .padding()
}
