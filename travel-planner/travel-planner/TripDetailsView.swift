//
//  tripDetails.swift
//  travel-planner
//
//  Created by iMac11 on 23/02/2026.
//

import SwiftUI

struct tripDetailsView: View {
    @Binding var travel: trip
    @State private var isEditing = false
    let types = ["Leisure", "Work", "Family", "Adventure", "Cultural"]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ZStack(alignment: .bottomTrailing) {
                    LinearGradient(colors: [Color.blue, Color(red: 0.0, green: 0.1, blue: 0.3)],
                                               startPoint: .top,
                                               endPoint: .bottom)
                                    .ignoresSafeArea()
                    if let data = travel.imageData, let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 350)
                            .clipped()
                    } else {
                        Image(travel.image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 350)
                            .clipped()
                    }
                }

                VStack(spacing: 8) {
                    Text(travel.tripName).font(.title2).bold()
                    Divider()
                    VStack(alignment: .leading, spacing: 10) {
                        Label("Destination: \(travel.tripDestination)", systemImage: "mappin.and.ellipse")
                        Label("Start: \(travel.tripStart)", systemImage: "calendar")
                        Label("End: \(travel.tripEnd)", systemImage: "calendar.badge.clock")
                        Label(" \(travel.tripType)", systemImage: "tag.fill")
                    }.font(.body)
                }.padding()
            }
        }
        .navigationTitle("Details")
        .toolbar { Button("Edit") { isEditing = true } }
        .sheet(isPresented: $isEditing) {
            NavigationStack {
                Form {
                    Section() {
                        TextField("Name", text: $travel.tripName)
                        TextField("Destination", text: $travel.tripDestination)
                        TextField("Start Date (DD/MM/YYYY)", text: $travel.tripStart)
                        TextField("End Date (DD/MM/YYYY)", text: $travel.tripEnd)
                        Picker("Type", selection: $travel.tripType) {
                            ForEach(types, id: \.self) { type in
                                Text(type).tag(type)
                            }
                        }
                    }                }
                .navigationTitle("Edit Information")
                .toolbar { Button("Done") { isEditing = false } }
            }
        }
    }
}

#Preview {
    NavigationStack {
        tripDetailsView(travel: .constant(Listtrip().allTrips[0]))
    }
}
