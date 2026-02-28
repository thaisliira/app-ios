//
//  AddTripView.swift
//  travel-planner
//
//  Created by iMac11 on 23/02/2026.
//

import SwiftUI
import PhotosUI

struct AddTripView: View {
    @Environment(\.dismiss) var dismiss
    var onAdd: (trip) -> Void
    
    // Nomes em inglês como pediste
    @State private var name = ""
    @State private var destination = ""
    @State private var startDate = ""
    @State private var endDate = ""
    @State private var selectedType = "Leisure"
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImageData: Data?
    
    let categories = ["Leisure", "Work", "Family", "Adventure", "Cultural"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Trip Info") {
                    TextField("Name", text: $name)
                    TextField("Destination", text: $destination)
                    
                    Picker("Type", selection: $selectedType) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                        }
                    }
                }
                
                Section("Photo") {
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        Label("Pick from Gallery", systemImage: "photo.badge.plus")
                    }
                    
                    if let data = selectedImageData, let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(12)
                    }
                }
                
                Section("Dates") {
                    TextField("Start Date (DD/MM/YYYY)", text: $startDate)
                    TextField("End Date (DD/MM/YYYY)", text: $endDate)
                }            }
            .navigationTitle("New Trip")
            .onChange(of: selectedItem) { oldValue, newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newTrip = trip(
                            id: Int.random(in: 100...9999),
                            tripName: name,
                            tripDestination: destination,
                            tripStart: startDate,
                            tripEnd: endDate,
                            tripType: selectedType,
                            image: "",
                            imageData: selectedImageData
                        )
                        onAdd(newTrip)
                        dismiss()
                    }
                    .disabled(name.isEmpty || destination.isEmpty || selectedImageData == nil)
                }
            }
        }
    }
}
