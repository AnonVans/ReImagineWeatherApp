//
//  UVInformation.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import Foundation

struct UVInformation: WeatherDetailInformation {
    var infoTitle: String {
        return String(localized: "What is UV Index?")
    }
    
    var infoDescription: String {
        return String(localized: "The UV Index is a measure of the strength of ultraviolet (UV) radiation from the sun at a specific place and time. It helps indicate the potential risk of harm from sun exposure, with higher values indicating a greater risk.")
    }
    
    var infoDetailTitle: String {
        return String(localized: "UVI Level")
    }
    
    func getInfoDetails() -> [InfoDetailCard] {
        var infoDetails = [InfoDetailCard]()
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "UV Index: 0-2"),
                infoDetailType: String(localized: "Level: Low"),
                infoDetailDescription: String(localized: "Enjoy your time outside, but consider wearing sunglasses and applying sunscreen if you'll be out for long periods.")
        ))
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "UV Index: 3-5"),
                infoDetailType: String(localized: "Level: Moderate"),
                infoDetailDescription: String(localized: "Seek shade when possible. Wear protective clothing, a hat, and sunglasses. Apply broad-spectrum SPF 30+ sunscreen, and reapply every 2 hours.")
        ))
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "UV Index: 6-7"),
                infoDetailType: String(localized: "Level: High"),
                infoDetailDescription: String(localized: "Limit your time in direct sunlight. Wear protective clothing, a hat, and sunglasses. Apply broad-spectrum SPF 30+ sunscreen, and reapply every 2 hours.")
        ))
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "UV Index: 8-10"),
                infoDetailType: String(localized: "Level: Very High"),
                infoDetailDescription: String(localized: "Enjoy your time outside, but consider wearing sunglasses and applying sunscreen if you'll be out for long periods.")
        ))
        
        infoDetails.append(InfoDetailCard(
                infoDetailName: String(localized: "UV Index: 11+"),
                infoDetailType: String(localized: "Level: Extreme"),
                infoDetailDescription: String(localized: "Avoid sun exposure as much as possible. Wear protective clothing, a hat, and sunglasses. Apply broad-spectrum SPF 30+ sunscreen every 2 hours or after swimming or sweating.")
        ))
        
        return infoDetails
    }
}
