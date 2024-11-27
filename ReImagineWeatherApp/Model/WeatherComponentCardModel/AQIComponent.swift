//
//  AQIComponent.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 17/07/24.
//

import Foundation

struct AQIComponent: ComponentsProtocol {
    func populateData() -> [String : ComponentInfo] {
        let data: [String: ComponentInfo] = [
            "NoData": ComponentInfo(
                componentTitle: "",
                componentDescription: "",
                componentImage: "",
                componentType: ""),
            "Good": ComponentInfo(
                componentTitle: String(localized: "Good Air Quality"),
                componentDescription: String(localized: "Enjoy the outdoors! Air quality is excellent for all activities."),
                componentImage: "",
                componentType: ""),
            "ModerateAQ": ComponentInfo(
                componentTitle: String(localized: "Moderate Air Quality"),
                componentDescription: String(localized: "Air quality is acceptable. However, there may be risk for unusually sensitive people. Consider making outdoor activities shorter if you’re unusually sensitive to particle pollution."),
                componentImage: "",
                componentType: ""),
            "UnhealthyPartly": ComponentInfo(
                componentTitle: String(localized: "Sensitive Air Quality"),
                componentDescription: String(localized: "Sensitive groups (children, elderly, and those with respiratory issues) should reduce outdoor activities. Everyone else can enjoy but wear a mask if exerting themselves."),
                componentImage: "",
                componentType: ""),
            "Unhealthy": ComponentInfo(
                componentTitle: String(localized: "Unhealthy Air Quality"),
                componentDescription: String(localized: "Limit outdoor activities. Everyone should consider wearing masks to reduce exposure."),
                componentImage: "",
                componentType: ""),
            "VeryUnhealthy": ComponentInfo(
                componentTitle: String(localized: "Very Unhealthy Air Quality"),
                componentDescription: String(localized: "Avoid outdoor activities. Everyone should wear masks if outside and limit exposure to air pollution."),
                componentImage: "",
                componentType: ""),
            "Hazardous": ComponentInfo(
                componentTitle: String(localized: "Hazardous Air Quality"),
                componentDescription: String(localized: "Stay indoors. Avoid all outdoor activities. Everyone should wear masks if they must go outside. Health warnings in effect for all."),
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
