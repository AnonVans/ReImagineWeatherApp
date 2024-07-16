//
//  LocationServiceManager.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import Foundation
import CoreLocation

protocol CoreLocationServiceDelegate {
    func getCoordinate(coordinate: String)
}

//location model

struct LocationModel {
    let latitude: Double
    let longitude: Double
    var address: String?
}

class LocationServiceManager: NSObject, CLLocationManagerDelegate {
    var currentLocation: LocationModel?
    var coordinatesFromAddress: (latitude: Double, longitude: Double)?
    var errorMessage: String?

    private var locationManager: CLLocationManager

    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }

    func fetchAddress(from location: CLLocation, completion: @escaping (String?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Error reverse geocoding location: \(error.localizedDescription)")
                completion(nil)
            } else {
                let placemark = placemarks?.first
                let address = [placemark?.name, placemark?.locality, placemark?.administrativeArea, placemark?.country].compactMap { $0 }.joined(separator: ", ")
                completion(address)
            }
        }
    }

    func fetchCoordinates(from address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let error = error {
                print("Error geocoding address: \(error.localizedDescription)")
                completion(nil)
            } else {
                let location = placemarks?.first?.location
                print("Geocoded address: \(String(describing: location?.coordinate))")
                completion(location?.coordinate)
            }
        }
    }

    func searchLocations(query: String, completion: @escaping ([String]) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(query) { placemarks, error in
            if let error = error {
                print("Error searching locations: \(error.localizedDescription)")
                completion([])
            } else {
                let locations = placemarks?.compactMap { placemark in
                    return [placemark.name, placemark.locality, placemark.administrativeArea, placemark.country].compactMap { $0 }.joined(separator: ", ")
                } ?? []
                completion(locations)
            }
        }
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        fetchAddress(from: location) { [weak self] address in
            DispatchQueue.main.async {
                if let address = address {
                    self?.coordinatesFromAddress = (latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                    self?.errorMessage = nil
                } else {
                    self?.errorMessage = "Failed to fetch address."
                }
            }
        }
        print("Updated location: Latitude \(location.coordinate.latitude), Longitude \(location.coordinate.longitude)")
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.errorMessage = "Failed to find user's location: \(error.localizedDescription)"
        }
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
