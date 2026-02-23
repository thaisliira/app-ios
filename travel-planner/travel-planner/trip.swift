//
//  trip.swift
//  travel-planner
//
//  Created by iMac11 on 23/02/2026.
//

import Foundation

struct trip: Codable, Identifiable {
    let id: Int
    var tripName: String
    var destination: String
    var tripStart: String
    var tripEnd: String
    var tripType: String
    var image: String
    var imageData: Data?
}
