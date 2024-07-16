//
//  AQInformation.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import Foundation

struct AQInformation: WeatherDetailInformation {
    var infoTitle: String {
        return String(localized: "What is Air Quality Index?")
    }
    
    var infoDescription: String {
        return String(localized: "The Air Quality Index (AQI) is a scale used to measure and report air quality levels. It indicates how clean or polluted the air is and what associated health effects might be a concern for the public. Higher AQI values represent higher levels of air pollution and greater health risks.")
    }
    
    var infoDetailTitle: String {
        return String(localized: "AQI Level")
    }
    
    func getInfoDetails() -> [InfoDetailCard] {
        var infoDetails = [InfoDetailCard]()
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "AQ Index: 0-50"),
                infoDetailType: String(localized: "Level: Good"),
                infoDetailDescription: String(localized: "Enjoy the outdoors! Air quality is excellent for all activities.")
        ))
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "AQ Index: 51-100"),
                infoDetailType: String(localized: "Level: Moderate"),
                infoDetailDescription: String(localized: "Air quality is acceptable. However, there may be risk for unusually sensitive people. Consider making outdoor activities shorter if you’re unusually sensitive to particle pollution.")
        ))
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "AQ Index: 101-150"),
                infoDetailType: String(localized: "Level: Unhealthy\nfor Some people"),
                infoDetailDescription: String(localized: "Sensitive groups (children, elderly, and those with respiratory issues) should reduce outdoor activities. Everyone else can enjoy but wear a mask if exerting themselves.")
        ))
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "AQ Index: 151-200"),
                infoDetailType: String(localized: "Level: Unhealthy"),
                infoDetailDescription: String(localized: "Limit outdoor activities. Everyone should consider wearing masks to reduce exposure.")
        ))
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "AQ Index: 201-300"),
                infoDetailType: String(localized: "Level: Very Unhealthy"),
                infoDetailDescription: String(localized: "Avoid outdoor activities. Everyone should wear masks if outside and limit exposure to air pollution.")
        ))
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "AQ Index: 301-500"),
                infoDetailType: String(localized: "Level: Hazardous"),
                infoDetailDescription: String(localized: "Stay indoors. Avoid all outdoor activities. Everyone should wear masks if they must go outside. Health warnings in effect for all.")
        ))
        
        return infoDetails
    }
}
