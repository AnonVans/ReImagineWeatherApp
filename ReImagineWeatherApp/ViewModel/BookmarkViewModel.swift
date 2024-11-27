//
//  BookmarkViewModel.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 20/09/24.
//

import Foundation
import SwiftData

class BookmarkViewModel {
    var dataService = DataPersistanceManager.shared
    
    func fetchLocations() -> [BookmarkedLocation] {
        var locations: [BookmarkedLocation]?
        
        do {
            let fetchDescriptor = FetchDescriptor<BookmarkedLocation>()
            locations = try dataService.context.fetch(fetchDescriptor)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
        return locations?.reversed() ?? [BookmarkedLocation]()
    }
    
    func fecthCoordinates(locations: [BookmarkedLocation]) -> [(lat: Double, lon: Double)] {
        var coordinates = [(lat: Double, lon: Double)]()
        
        for location in locations {
            coordinates.append((location.latitude, location.longitude))
        }
        
        return coordinates
    }
    
//    func deleteAll(locations: [BookmarkedLocation]) {
//        for location in locations {
//            dataService.context?.delete(location)
//        }
//    }
}
