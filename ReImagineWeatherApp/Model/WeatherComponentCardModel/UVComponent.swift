//
//  UVComponent.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 17/07/24.
//

import Foundation

struct UVComponent: ComponentsProtocol {
    func populateData() -> [String : ComponentInfo] {
        let data: [String: ComponentInfo] = [
            "Low": ComponentInfo(
                componentTitle: String(localized: "Low UV"),
                componentDescription: String(localized: "Enjoy your time outside, but consider wearing sunglasses and applying sunscreen if you'll be out for long periods."),
                componentImage: "",
                componentType: ""),
            "Moderate": ComponentInfo(
                componentTitle: String(localized: "Moderate UV Alert"),
                componentDescription: String(localized: "Seek shade when possible. Wear protective clothing, a hat, and sunglasses. Apply broad-spectrum SPF 30+ sunscreen, and reapply every 2 hours."),
                componentImage: "",
                componentType: ""),
            "High": ComponentInfo(
                componentTitle: String(localized: "High UV Alert"),
                componentDescription: String(localized: "Limit your time in direct sunlight. Wear protective clothing, a hat, and sunglasses. Apply broad-spectrum SPF 30+ sunscreen, and reapply every 2 hours."),
                componentImage: "",
                componentType: ""),
            "VeryHigh": ComponentInfo(
                componentTitle: String(localized: "Very High UV Alert"),
                componentDescription: String(localized: "Minimize your sun exposure. Seek shade, wear protective clothing, a hat, and sunglasses. Apply broad-spectrum SPF 30+ sunscreen, and reapply every 2 hours."),
                componentImage: "",
                componentType: ""),
            "Extreme": ComponentInfo(
                componentTitle: String(localized: "Extreme UV Alert"),
                componentDescription: String(localized: "Avoid sun exposure as much as possible. Wear protective clothing, a hat, and sunglasses. Apply broad-spectrum SPF 30+ sunscreen every 2 hours or after swimming or sweating."),
                componentImage: "",
                componentType: "")
        ]
        
        return data
    }
    
    func getInfoDetails(type typeName: String) -> ComponentInfo {
        let data = self.populateData()
        return data[typeName]!
    }
}
