//
//  ContentView.swift
//  travel-planner
//
//  Created by iMac11 on 23/02/2026.
//

import SwiftUI

struct ContentView: View {
    @State var listaviagens = Listtrip().allTrips
    @State private var showingAbout = false
    @State private var showingAddTrip = false
    @State private var showingDeleteAlert = false

    var body: some View {
        NavigationStack {
            List {
                ForEach($listaviagens) { $viagem in
                    NavigationLink {
                        tripDetailsView(travel: $viagem)
                    } label: {
                        HStack(spacing: 15) {
                            if let data = viagem.imageData, let uiImage = UIImage(data: data) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 55, height: 55)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            } else {
                                Image(viagem.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 55, height: 55)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text(viagem.tripName)
                                    .font(.headline)
                                Text(viagem.destination)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: removerViagem)
            }
            .navigationTitle("Travel Planner")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button { showingAbout = true } label: {
                        Image(systemName: "info.circle")
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button { showingAddTrip = true } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.blue)
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button(role: .destructive) {
                        showingDeleteAlert = true
                    } label: {
                        Label("Clear All Trips", systemImage: "trash")
                    }
                    .disabled(listaviagens.isEmpty)
                }
            }
            .alert("Clear All Data?", isPresented: $showingDeleteAlert) {
                Button("Delete Everything", role: .destructive) {
                    listaviagens.removeAll()
                }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("This will permanently remove all trips from your planner.")
            }
            .sheet(isPresented: $showingAbout) { AboutAppView() }
            .sheet(isPresented: $showingAddTrip) {
                AddTripView { newTrip in
                    listaviagens.append(newTrip)
                }
            }
        }
        .preferredColorScheme(.dark)
    }

    func removerViagem(at offsets: IndexSet) {
        listaviagens.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
