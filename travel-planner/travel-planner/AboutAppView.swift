//
//  about.swift
//  travel-planner
//
//  Created by iMac11 on 23/02/2026.
//

import SwiftUI

struct AboutAppView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.blue.opacity(0.3), Color.black],
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 35) {
                    VStack(spacing: 15) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 130)
                            .clipShape(Circle())
                        
                        Text("Travel Planner")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 40)

                    VStack(spacing: 5) {
                        Text("Developed by")
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.8))
                        Text("Thais Lira")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }

                    VStack(spacing: 12) {
                        Text("App Features")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            FeatureRow(text: "• JSON Data Handling")
                            FeatureRow(text: "• Real-time Editing (@Binding)")
                            FeatureRow(text: "• Device Image Selection")
                            FeatureRow(text: "• Trip Management (Add/Delete/Edit)")
                        }
                    }
                    .padding()
                    .background(Color.blue.opacity(0.3))
                    .cornerRadius(15)

                    VStack(spacing: 10) {
                        Text("Rate this App")
                            .font(.headline)
                            .foregroundColor(.white)
                        
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
        }
        .preferredColorScheme(.dark)
    }
}

struct FeatureRow: View {
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.subheadline)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    AboutAppView()
}
