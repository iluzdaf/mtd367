//
//  TodoDetailView.swift
//  Todo
//
//  Created by Fadzuli Said on 25/7/25.
//

import SwiftUI
import PhotosUI
import MapKit

struct TodoDetailView: View {
    @Bindable var item: TodoItem
    @State private var pickerItem: PhotosPickerItem?
    @Environment(\.dismiss) private var dismiss
    var soundManager = SoundManager()
    var locationManager = LocationManager()

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

            Section(header: Text("AR Demo")) {
                NavigationLink("Open AR View") {
                    ARViewContainer()
                        .edgesIgnoringSafeArea(.all)
                        .navigationTitle("AR Viewer")
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
            
            Section(header: Text("Location")) {
                if let lat = item.latitude, let lon = item.longitude {
                    Text("Lat: \(lat), Lon: \(lon)")
                    Map(coordinateRegion: .constant(
                           MKCoordinateRegion(
                               center: CLLocationCoordinate2D(latitude: lat, longitude: lon),
                               span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                           )
                       ),
                       interactionModes: []
                   )
                   .frame(height: 200)
                   .clipShape(RoundedRectangle(cornerRadius: 12))
                } else if let coord = locationManager.currentLocation {
                    Button("Save Current Location") {
                        item.latitude = coord.latitude
                        item.longitude = coord.longitude
                    }
                } else {
                    Text("Getting current location...")
                        .foregroundStyle(.gray)
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
