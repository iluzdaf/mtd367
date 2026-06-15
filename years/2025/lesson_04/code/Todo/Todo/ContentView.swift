//
//  ContentView.swift
//  Todo
//
//  Created by Fadzuli Said on 22/7/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \TodoItem.createdAt) var items: [TodoItem]
    @Environment(\.modelContext) private var modelContext
    @State private var newTitle: String = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    HStack {
                        Text(item.title)
                        Spacer()
                        Button(action: {
                            item.isCompleted.toggle()
                        }) {
                            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                        }
                    }
                }
                .onDelete { indices in
                    for index in indices {
                        modelContext.delete(items[index])
                    }
                }
            }
            .navigationTitle("To-Do List")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        TextField("New Task", text: $newTitle)
                            .textFieldStyle(.roundedBorder)
                        Button("Add") {
                            let newItem = TodoItem(title: newTitle)
                            modelContext.insert(newItem)
                            newTitle = ""
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}
