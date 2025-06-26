//
//  TodoRowView.swift
//  ToDoList
//
//  Created by Charles on 26/06/2025.
//

import SwiftUI

struct TodoRowView: View {
    let todo: TodoItem
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                Text(todo.todo)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .foregroundStyle(Color.primary)
                Spacer()
                
                let priorityText = todo.priority.title
                let priorityColor = todo.priority.color
                let backgroundShape = Capsule().fill(priorityColor).opacity(0.3)
                
                Text(priorityText)
                    .font(.system(size: 13, weight: .bold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .foregroundStyle(priorityColor)
                    .background(backgroundShape)
            }
        }
    }
}

extension PriorityType {
    var color: Color {
        switch self {
        case .normal:
            return .blue
        case .urgent:
            return .red
        case .optional:
            return .green
        }
    }
}

#Preview {
    TodoRowView(todo: .init(todo: "Test todo", priority: .normal), onTap: { })
}
