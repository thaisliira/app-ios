//
//  about.swift
//  travel-planner
//
//  Created by iMac11 on 23/02/2026.
//

import SwiftUI

struct AboutAppView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 35) {
                VStack(spacing: 10) {
                    Image(systemName: "airplane.circle.fill")
                        .font(.system(size: 70))
                        .foregroundColor(.blue)
                    
                    Text("Travel Planner")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                }
                .padding(.top, 40)

                VStack(spacing: 5) {
                    Text("Developed by")
                        .font(.headline)
                    Text("Thais Lira")
                        .foregroundColor(.secondary)
                }

                VStack(spacing: 12) {
                    Text("App Features")
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        FeatureRow( text: "JSON Data")
                        FeatureRow( text: "Real-time Editing (@Binding)")
                        FeatureRow( text: "Device Image Selection")
                        FeatureRow( text: "Trip Management (Add/Delete/Edit)")
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)

                // App Rating Section
                VStack(spacing: 10) {
                    Text("Rate this App")
                        .font(.headline)
                    
                    HStack(spacing: 8) {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.title2)
                        }
                    }
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("About")
        .preferredColorScheme(.dark)
    }
}

struct FeatureRow: View {
    let text: String
    
    var body: some View {
        HStack(spacing: 10) {
            Text(text)
                .font(.subheadline)
        }
    }
}

#Preview {
    AboutAppView()
}
