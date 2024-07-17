//
//  WeatherComponent.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 17/07/24.
//

import Foundation

struct WeatherComponent: ComponentsProtocol {
    func populateData() -> [String : ComponentInfo] {
        let data: [String: ComponentInfo] = [
            "ClearDay": ComponentInfo(
                componentTitle: String(localized: "Clear Day Safety"),
                componentDescription: String(localized: "Stay hydrated and wear lightweight clothing. Avoid strenuous activities during peak heat hours and seek shade or air-conditioned places."),
                componentImage: "sun.max.circle.fill",
                componentType: "ClearDay"),
            "Rainny": ComponentInfo(
                componentTitle: String(localized: "Rainy Weather Safety"),
                componentDescription: String(localized: "Wear waterproof jackets, boots, and carry an umbrella. Watch for slippery surfaces and avoid flooded areas. Drive slower and keep a safe distance."),
                componentImage: "cloud.rain.circle.fill",
                componentType: "Rainny"),
            "ClearNight": ComponentInfo(
                componentTitle: String(localized: "Clear Night Safety"),
                componentDescription: String(localized: "Dress warmly if it's cool. Ensure you have proper lighting and reflectors if walking or biking. Stay aware of your surroundings and carry a flashlight for better visibility."),
                componentImage: "moon.stars.circle.fill",
                componentType: "ClearNight")
        ]
        
        return data
    }
    
    func getInfoDetails(type typeName: String) -> ComponentInfo {
        let data = self.populateData()
        return data[typeName]!
    }
}
