//
//  TodoItem.swift
//  Todo
//
//  Created by Fadzuli Said on 22/7/25.
//

import Foundation
import SwiftData

@Model
class TodoItem {
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    var imageData: Data?

    init(title: String, isCompleted: Bool = false, createdAt: Date = Date(), imageData: Data? = nil) {
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = createdAt
        self.imageData = imageData
    }
}
