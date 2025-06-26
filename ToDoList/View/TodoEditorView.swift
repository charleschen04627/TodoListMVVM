//
//  TodoEditorView.swift
//  ToDoList
//
//  Created by Charles on 26/06/2025.
//

import SwiftUI

struct TodoEditorView: View {
    let viewModel: TodoListViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State private var text: String = ""
    @State private var selectedPriority: PriorityType = .optional
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Todo title")
                    .font(.headline)
                TextField("Todo title", text: $text)
                    .font(.system(size: 15))
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)

                Text("Priority")
                    .font(.headline)
                
                PriorityButtonView(selectedPriority: $selectedPriority)
                    .frame(maxWidth: .infinity)

                TodoActionButtonView(
                    viewModel: viewModel,
                    todoItem: TodoItem(todo: text, priority: selectedPriority),
                    onSuccess: { dismiss() },
                    onError: { title, message in
                        alertTitle = title
                        alertMessage = message
                        showAlert = true
                    }
                )

                Spacer()
            }
            .onAppear {
                if let todo = viewModel.todoItemToEdit {
                    text = todo.todo
                    selectedPriority = todo.priority
                }
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .alert(alertTitle, isPresented: $showAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
}

#Preview {
    TodoEditorView(viewModel: TodoListViewModel())
}
