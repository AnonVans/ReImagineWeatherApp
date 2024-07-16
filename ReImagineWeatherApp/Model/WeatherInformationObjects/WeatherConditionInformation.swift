//
//  WeatherConditionInformation.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import Foundation

struct WeatherConditionInformation: WeatherDetailInformation {
    var infoTitle: String {
        return String(localized: "What is Weather Safety Tips?")
    }
    
    var infoDescription: String {
        return String(localized: "The UV Index is a measure of the strength of ultraviolet (UV) radiation from the sun at a specific place and time. It helps indicate the potential risk of harm from sun exposure, with higher values indicating a greater risk.")
    }
    
    var infoDetailTitle: String {
        return String(localized: "Safety Tips")
    }
    
    func getInfoDetails() -> [InfoDetailCard] {
        var infoDetails = [InfoDetailCard]()
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "Clear Day Weather Safety"),
                infoDetailType: "sun.max.circle.fill",
                infoDetailDescription: String(localized: "Stay hydrated, wear lightweight clothing, and seek shade or air-conditioned places. Avoid strenuous activities during the hottest parts of the day.")
        ))
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "Rainy Weather Safety"),
                infoDetailType: "cloud.rain.circle.fill",
                infoDetailDescription: String(localized: "Wear waterproof jackets, boots, and carry an umbrella. Watch for slippery surfaces and avoid flooded areas. Drive slower and keep a safe distance.")
        ))
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "Clear Night Weather Safety"),
                infoDetailType: "moon.stars.circle.fill",
                infoDetailDescription: String(localized: "Dress warmly if it's cool. Ensure you have proper lighting and reflectors if walking or biking. Stay aware of your surroundings and carry a flashlight for better visibility.")
        ))
        
        return infoDetails
    }
}
