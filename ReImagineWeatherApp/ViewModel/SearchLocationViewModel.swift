//
//  SearchLocationViewModel.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import Foundation
import CoreLocation
import Combine

class SearchLocationViewModel {
    var locationServiceManager: LocationServiceManager

    init(locationServiceManager: LocationServiceManager = LocationServiceManager()) {
        self.locationServiceManager = locationServiceManager
    }
    
    var coordinatesFromAddress: CLLocationCoordinate2D? {
        if let coordinates = locationServiceManager.coordinatesFromAddress {
            return CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
        }
        return nil
    }

    var errorMessage: String? {
        locationServiceManager.errorMessage
    }

    func startUpdatingLocation() {
        locationServiceManager.startUpdatingLocation()
    }

    func stopUpdatingLocation() {
        locationServiceManager.stopUpdatingLocation()
    }

    func fetchCoordinates(from address: String, completion: @escaping ((latitude: Double, longitude: Double)?) -> Void) {
            locationServiceManager.fetchCoordinates(from: address) { coordinates in
                guard let coordinates = coordinates else {
                    completion(nil)
                    return
                }
                completion((latitude: coordinates.latitude, longitude: coordinates.longitude))
            }
        }
    
    func searchLocations(query: String, completion: @escaping ([String]) -> Void) {
         locationServiceManager.searchLocations(query: query, completion: completion)
     }
}


