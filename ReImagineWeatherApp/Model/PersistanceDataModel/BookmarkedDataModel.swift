//
//  BookmarkLocationDataModel.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import Foundation
import SwiftData

@Model
class BookmarkedLocation: Identifiable {
    var id: UUID
    var placeName: String
    var city: String
    var latitude: Double
    var longitude: Double
    
    init(id: UUID = UUID(), placeName: String = "Green Office Park", city: String = "Cisauk, Tangerang", latitude: Double = -6.178356, longitude: Double = 106.6301559) {
        self.id = id
        self.placeName = placeName
        self.city = city
        self.latitude = latitude
        self.longitude = longitude
    }
}
