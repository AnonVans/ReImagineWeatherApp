//
//  WeatherDataObject.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import Foundation
import SwiftUI

class ParentWeather {
    var location: (lat: Double, lon: Double)
    var dateTime: Date
    var imageName: String
    var renderingMode: SymbolRenderingMode
    var imageColor: (baseColor: Color, accentColor: Color)
    var color: Color
    var UVI: Int
    var AQI: APDataModel
    var condition: String
    var weatherType: String
    var temp: Int
    var weatherClassification: Int
    
    init(
        location: (lat: Double, lon: Double) = (0.0, 0.0),
        dateTime: Date = (Date.now),
        imageName: String = "exclamationmark.triangle.fill",
        renderingMode: SymbolRenderingMode = .monochrome,
        imageColor: (baseColor: Color, accentColor: Color) = (Color.red, Color.red),
        color: Color = Color.black,
        UVI: Int = -1,
        AQI: APDataModel = APDataModel(),
        condition: String = "Error",
        weatherType: String = "Rainny",
        temp: Int = -1,
        weatherClassification: Int = 1
    ) {
            self.location = location
            self.dateTime = dateTime
            self.imageName = imageName
            self.renderingMode = renderingMode
            self.imageColor = imageColor
            self.color = color
            self.UVI = UVI
            self.AQI = AQI
            self.condition = condition
            self.weatherType = weatherType
            self.temp = temp
            self.weatherClassification = weatherClassification
    }
    
    func getUVILevel() -> UVIType {
        return UVIType.getType(self.UVI)
    }
    
    func getAQILevel() -> AQIType {
        return AQIType.getType(self.AQI.aqi)
    }
    
    func getStatus() -> WeatherStatus {
        let levels = [UVIType.getLevel(self.getUVILevel()), AQIType.getLevel(self.getAQILevel())]
        let max = levels.max()
        
        switch max {
            case 1: return .Safe
            case 2: return .Caution
            default: return .Unsafe
        }
    }
    
    func getImage() -> Image {
        return Image(systemName: imageName)
    }
}

class CloudyNoon: ParentWeather {
    init() {
        super.init()
        self.imageName = "cloud.sun.fill"
        self.renderingMode = .multicolor
        self.color = .cloudy
    }
}

class CloudyNight: ParentWeather {
    init() {
        super.init()
        self.imageName = "cloud.moon.fill"
        self.renderingMode = .multicolor
        self.color = .cloudyNight
    }
}

class ClearNight: ParentWeather {
    init() {
        super.init()
        self.imageName = "moon.stars.fill"
        self.renderingMode = .multicolor
        self.color = .clearNight
    }
}

class SunnyDay: ParentWeather {
    init() {
        super.init()
        self.imageName = "sun.max.fill"
        self.renderingMode = .multicolor
        self.color = .sunny
    }
}

class RainnyDay: ParentWeather {
    init() {
        super.init()
        self.imageName = "cloud.rain.fill"
        self.renderingMode = .multicolor
        self.color = .rain
    }
    
    override func getStatus() -> WeatherStatus {
        let levels = [UVIType.getLevel(self.getUVILevel()), AQIType.getLevel(self.getAQILevel()), 2]
        let max = levels.max()
        
        switch max {
            case 1: return .Safe
            case 2: return .Caution
            default: return .Unsafe
        }
    }
}

class StormyDay: ParentWeather {
    init() {
        super.init()
        self.imageName = "cloudThunder"
        self.renderingMode = .multicolor
        self.color = .rain
    }
    
    override func getImage() -> Image {
        return Image(imageName)
    }
    
    override func getStatus() -> WeatherStatus {
        let levels = [UVIType.getLevel(self.getUVILevel()), AQIType.getLevel(self.getAQILevel()), 3]
        let max = levels.max()
        
        switch max {
            case 1: return .Safe
            case 2: return .Caution
            default: return .Unsafe
        }
    }
}
