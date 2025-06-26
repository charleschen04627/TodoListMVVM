# ToDoList iOS Application

A modern todo list management application built with SwiftUI and MVVM architecture.

## 📱 Features

### ✨ Core Features

- **Add Todo Items**: Easily add new todo items
- **Edit Todo Items**: Tap any item to edit
- **Delete Todo Items**: Swipe left to delete unwanted items
- **Priority Management**: Support for three priority levels (Urgent, Normal, Optional)

### 🔧 Technical Features

- **MVVM Architecture**: Clean code structure
- **SwiftUI**: Modern declarative UI framework
- **@Observable**: iOS 17+ new features
- **Modular Design**: Reusable UI components

## 🏗️ Project Architecture

```
ToDoList/
├── Model/
│   ├── TodoItem.swift          # Todo item data model
│   └── PriorityType.swift      # Priority type definitions
├── ViewModel/
│   └── TodoListViewModel.swift # Business logic and state management
├── View/
│   ├── ContentView.swift       # Main view
│   ├── TodoRowView.swift       # Todo item row view
│   ├── TodoEditorView.swift    # Editor view
│   ├── TodoActionButtonView.swift # Action button
│   └── PriorityButtonView.swift # Priority selector
└── ToDoListApp.swift           # Application entry point
```

## 🚀 Installation & Setup

### System Requirements

- iOS 17.0 or higher
- Xcode 15.0 or higher
- macOS 14.0 or higher

### Installation Steps

1. Clone the project to your local machine

   ```bash
   git clone [repository-url]
   cd ToDoList
   ```

2. Open the project in Xcode

   ```bash
   open ToDoList.xcodeproj
   ```

3. Select target device or simulator

4. Click the Run button (⌘+R)

## 📖 Usage Guide

### Adding Todo Items

1. Tap the "+" button in the top right corner
2. Enter the todo title (minimum 2 characters)
3. Select priority (Urgent/Normal/Optional)
4. Tap "Create" button to complete

### Editing Todo Items

1. Tap any todo item
2. Modify the title or priority
3. Tap "Update" button to save changes

### Deleting Todo Items

1. Swipe left on the todo item
2. Tap "Delete" button

## 🛠️ Technical Architecture

### MVVM Pattern

- **Model**: Data structures and business rules
- **View**: User interface
- **ViewModel**: Business logic and state management

### Design Patterns

- **Single Responsibility Principle**: Each component has a clear responsibility
- **Dependency Injection**: Pass dependencies through parameters
- **Callback Pattern**: Use closures to handle events

## 🧪 Testing

The project includes comprehensive preview functionality that allows you to preview UI components directly in Xcode:

```swift
#Preview {
    ContentView()
}

#Preview("Todo Editor") {
    TodoEditorView(viewModel: TodoListViewModel(), todoItem: nil)
}
```
