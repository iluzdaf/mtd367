//
//  TodoDetailView.swift
//  Todo
//
//  Created by Fadzuli Said on 25/7/25.
//

import SwiftUI
import PhotosUI

struct TodoDetailView: View {
    @Bindable var item: TodoItem
    @State private var pickerItem: PhotosPickerItem?
    @Environment(\.dismiss) private var dismiss
    var soundManager = SoundManager()

    var body: some View {
        Form {
            Section(header: Text("Task")) {
                TextField("Title", text: $item.title)
                Toggle("Completed", isOn: $item.isCompleted)
                    .onChange(of: item.isCompleted) {
                        if item.isCompleted {
                            soundManager.playComplete()
                        }
                    }
            }

            Section(header: Text("Photo")) {
                if let data = item.imageData, let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                }

                PhotosPicker("Choose Photo", selection: $pickerItem, matching: .images)
                    .onChange(of: pickerItem) {
                        Task {
                            if let data = try? await pickerItem?.loadTransferable(type: Data.self) {
                                item.imageData = data
                            }
                        }
                    }
            }
        }
        .navigationTitle("Edit Task")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}
