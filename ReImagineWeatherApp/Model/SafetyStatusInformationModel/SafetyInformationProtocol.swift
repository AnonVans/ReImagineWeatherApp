//
//  SafetyInformationProtocol.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 17/07/24.
//

import Foundation

enum UVIType: String {
    case Low = "Low"
    case Moderate = "Moderate"
    case High = "High"
    case VeryHigh = "VeryHigh"
    case Extreme = "Extreme"
    
    static func getType(_ index: Int) -> UVIType {
        switch true {
            case (0...2).contains(index) : return .Low
            case (3...5).contains(index) : return .Moderate
            case (6...7).contains(index) : return .High
            case (8...10).contains(index) : return .VeryHigh
            default : return .Extreme
        }
    }
}

enum AQIType: String {
    case Good = "Good"
    case ModerateAQ = "Moderate"
    case UnhealthyPartly = "Unhealthy for some people"
    case Unhealthy = "Unhealthy"
    case VeryUnhealthy = "Very Unhealthy"
    case Hazardous = "Hazardous"
    
    static func getType(_ index: Int) -> AQIType {
        switch true {
            case (0...50).contains(index) : return .Good
            case (51...100).contains(index) : return .ModerateAQ
            case (101...150).contains(index) : return .UnhealthyPartly
            case (151...200).contains(index) : return .Unhealthy
            case (201...300).contains(index) : return .VeryUnhealthy
            default : return .Hazardous
        }
    }
}

protocol SafetyInformationProtocol {
    
}
