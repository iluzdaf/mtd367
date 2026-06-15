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
    @State private var selectedItem: TodoItem? = nil
    var soundManager = SoundManager()

    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    HStack {
                        Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                        Text(item.title)
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedItem = item
                    }
                    .onLongPressGesture {
                        item.isCompleted.toggle()
                        if item.isCompleted {
                            soundManager.playComplete()
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
            .sheet(item: $selectedItem) { item in
                NavigationStack {
                    TodoDetailView(item: item)
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: TodoItem.self, inMemory: true)
//}
