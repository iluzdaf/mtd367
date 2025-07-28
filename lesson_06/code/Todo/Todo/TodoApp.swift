//
//  TodoApp.swift
//  Todo
//
//  Created by Fadzuli Said on 22/7/25.
//

import SwiftUI
import SwiftData

@main
struct TodoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TodoItem.self)
    }
}
