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
    var gradientColor: (startColor: Color, endColor: Color)
    var UVI: Int
    var AQI: APDataModel
    var condition: String
    var temp: Int
    
    init(
        location: (lat: Double, lon: Double) = (0.0, 0.0),
        dateTime: Date = (Date.now),
        imageName: String = "exclamationmark.triangle.fill",
        renderingMode: SymbolRenderingMode = .monochrome,
        imageColor: (baseColor: Color, accentColor: Color) = (Color.red, Color.red),
        gradientColor: (startColor: Color, endColor: Color) = (Color.white, Color.black),
        UVI: Int = -1,
        AQI: APDataModel = APDataModel(),
        condition: String = "Error",
        temp: Int = -1) {
            self.location = location
            self.dateTime = dateTime
            self.imageName = imageName
            self.renderingMode = renderingMode
            self.imageColor = imageColor
            self.gradientColor = gradientColor
            self.UVI = UVI
            self.AQI = AQI
            self.condition = condition
            self.temp = temp
    }
    
    func getUVILevel() -> UVIType {
        return UVIType.getType(self.UVI)
    }
    
    func getAQILevel() -> AQIType {
        return AQIType.getType(self.AQI.aqi)
    }
}

class CloudyNoon: ParentWeather {
    init() {
        super.init()
        self.imageName = "cloud.sun.fill"
        self.renderingMode = .multicolor
        self.imageColor.baseColor = .primary
        self.imageColor.accentColor = .primary
        self.gradientColor.startColor = .brightGray
        self.gradientColor.endColor = .darkSkyBlue
    }
}

class CloudyNight: ParentWeather {
    init() {
        super.init()
        self.imageName = "cloud.moon.fill"
        self.renderingMode = .hierarchical
        self.imageColor.baseColor = .white
        self.imageColor.accentColor = .white
        self.gradientColor.startColor = .blueberry
        self.gradientColor.endColor = .vistaBlue
    }
}

class ClearNight: ParentWeather {
    init() {
        super.init()
        self.imageName = "moon.stars.fill"
        self.renderingMode = .multicolor
        self.imageColor.baseColor = .primary
        self.imageColor.accentColor = .primary
        self.gradientColor.startColor = .blueberry
        self.gradientColor.endColor = .unitedNationsBlue
    }
}

class SunnyDay: ParentWeather {
    init() {
        super.init()
        self.imageName = "sun.max.fill"
        self.renderingMode = .multicolor
        self.imageColor.baseColor = .primary
        self.imageColor.accentColor = .primary
        self.gradientColor.startColor = .cream
        self.gradientColor.endColor = .skyBlue
    }
}

class RainnyDay: ParentWeather {
    init() {
        super.init()
        self.imageName = "cloud.rain.fill"
        self.renderingMode = .palette
        self.imageColor.baseColor = .white
        self.imageColor.accentColor = .mayaBlue
        self.gradientColor.startColor = .blueberry
        self.gradientColor.endColor = .vistaBlue
    }
}

class StormyDay: ParentWeather {
    init() {
        super.init()
        self.imageName = "cloudThunder"
        self.renderingMode = .multicolor
        self.imageColor.baseColor = .primary
        self.imageColor.accentColor = .primary
        self.gradientColor.startColor = .lighterGray
        self.gradientColor.endColor = .philippineGray
    }
}
