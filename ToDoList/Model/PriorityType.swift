//
//  PriorityType.swift
//  ToDoList
//
//  Created by Charles on 26/06/2025.
//

import Foundation

enum PriorityType: CaseIterable, Identifiable {
    case normal
    case urgent
    case optional

    var id: Self { self }
    var title: String {
        switch self {
        case .normal:
            return "Normal"
        case .urgent:
            return "Urgent"
        case .optional:
            return "Optional"
        }
    }
}
