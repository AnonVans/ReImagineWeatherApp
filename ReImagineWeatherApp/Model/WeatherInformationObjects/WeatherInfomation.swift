//
//  WeatherInfomation.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import Foundation

enum InfoType {
    case Text
    case Image
    case Special
}

struct InfoDetailCard {
    var infoDetailName: String
    var infoDetailType: String
    var infoDetailDescription: String
}

protocol WeatherDetailInformation {
    var infoTitle: String { get }
    var infoDescription: String { get }
    var infoDetailTitle: String { get }
    
    func getInfoDetails() -> [InfoDetailCard]
}
