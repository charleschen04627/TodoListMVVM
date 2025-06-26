//
//  ContentView.swift
//  ToDoList
//
//  Created by Charles on 12/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = TodoListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.todoList) { todo in
                        TodoRowView(todo: todo) {
                            viewModel.showEditSheet(for: todo)
                        }
                    }
                    .onDelete { indexSet in
                        viewModel.deleteTodo(at: indexSet)
                    }
                }
            }
            .navigationTitle("ToDoList")
            .toolbar {
                Button {
                    viewModel.showAddSheet()
                } label: {
                    Image(systemName: "plus")
                }
            }
            // Sheet for EDITING an existing todo
            .sheet(item: $viewModel.todoItemToEdit) { _ in
                TodoEditorView(viewModel: viewModel)
            }
            // Sheet for ADDING a new todo
            .sheet(isPresented: $viewModel.showAddTodoSheet) {
                TodoEditorView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
