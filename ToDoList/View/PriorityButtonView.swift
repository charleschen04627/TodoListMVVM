//
//  PriorityButtonView.swift
//  ToDoList
//
//  Created by Charles on 26/06/2025.
//

import SwiftUI

struct PriorityButtonView: View {
    @Binding var selectedPriority: PriorityType
    var body: some View {
        HStack(spacing: 15) {
            ForEach(PriorityType.allCases) { type in
                Button(action: {
                    selectedPriority = type
                }) {
                    HStack(spacing: 6) {
                        Circle()
                            .fill(type.color)
                            .frame(width: 8, height: 8)
                        Text(type.title)
                            .font(.system(size: 14, weight: .medium))
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .fill(selectedPriority == type ? type.color.opacity(0.2) : Color(.systemGray6))
                            .overlay(
                                Capsule()
                                    .stroke(selectedPriority == type ? type.color : Color.clear, lineWidth: 2)
                            )
                    )
                    .foregroundStyle(
                        selectedPriority == type ? type.color : .primary
                    )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

#Preview {
    PriorityButtonView(selectedPriority: .constant(.optional))
}
