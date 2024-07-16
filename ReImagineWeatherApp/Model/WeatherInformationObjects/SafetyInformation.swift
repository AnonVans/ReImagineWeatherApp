//
//  SafetyInformation.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import Foundation

extension SafetyInformation {
    var save: (UV: String, AQ: String, Weather: String) {
        return (String(localized: "Low"), String(localized: "Low"), String(localized: "Cloudy\nPartly Cloudy"))
    }
    
    var caution: (UV: String, AQ: String, Weather: String) {
        return (String(localized: "Moderate\nHigh"), String(localized: "Moderate\nSensitive\nUnhealthy"), String(localized: " Mostly Sunny\nLight Rain\nHeavy Rain"))
    }
    
    var unsafe: (UV: String, AQ: String, Weather: String) {
        return (String(localized: "Very High\nExtreme"), String(localized: "Very Unhealthy\nHazardous"), String(localized: "Thunderstorm"))
    }
}

struct SafetyInformation: WeatherDetailInformation {
    var infoTitle: String {
        return String(localized: "What is Safety Status?")
    }
    
    var infoDescription: String {
        return String(localized: "Safety Status is a system designed to inform individuals about the safety of outdoor conditions based on factors such as weather, UV index, and air quality. It helps people determine the level of precaution needed to stay safe and healthy when going outside.")
    }

    
    var infoDetailTitle: String {
        return String(localized: "Safety Status")
    }

    
    func getInfoDetails() -> [InfoDetailCard] {
        var infoDetails = [InfoDetailCard]()
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "Safe"),
                infoDetailType: "circle.fill",
                infoDetailDescription: String(localized: "Conditions are favorable with no significant risks.")
        ))
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "Caution"),
                infoDetailType: "circle.fill",
                infoDetailDescription: String(localized: "Conditions require some precautions due to moderate risks")
        ))
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "Unsafe"),
                infoDetailType: "circle.fill",
                infoDetailDescription: String(localized: "Conditions are dangerous with high risks.")
        ))
        
        return infoDetails
    }
}
