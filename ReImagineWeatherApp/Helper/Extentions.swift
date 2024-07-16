////
////  Extentions.swift
////  ReImagineWeatherApp
////
////  Created by Stevans Calvin Candra on 16/07/24.
////
//
//import SwiftUI
//
//extension Image {
//    var defaultInfoSize: some View {
//        return self
//    }
//    
//    var clearDay: some View {
//        return self
//    }
//    
//    var rainy: some View {
//        return self
//    }
//    
//    var clearNight: some View {
//        return self
//    }
//    
//    var safe: some View {
//        return self
//    }
//    
//    var caution: some View {
//        return self
//    }
//    
//    var unsafe: some View {
//        return self
//    }
//}
//
//extension Text {
//    
//}
//
//
////Open-Close Jen- weather
//
//class AppWeather: Identifiable {
//    var id: Int
//    var type: String
//    var location: String
//    var city: String
//    var time: String
//    var UVI: Int
//    var AQI: Int
//    var image: String
//    var renderingMode: SymbolRenderingMode
//    var symbolColor: [Color]
//    var gradient: [Color]
//    var status: Status
//    
//    init(id: Int, type: String, location: String, city: String, time: String, UVI: Int, AQI: Int, image: String, renderingMode: SymbolRenderingMode, symbolColor: [Color], gradient: [Color], status: Status) {
//        self.id = id
//        self.type = type
//        self.location = location
//        self.city = city
//        self.time = time
//        self.UVI = UVI
//        self.AQI = AQI
//        self.image = image
//        self.renderingMode = renderingMode
//        self.symbolColor = symbolColor
//        self.gradient = gradient
//        self.status = status
//    }
//}
//class CloudyLight: AppWeather {
//    init(id: Int, location: String, city: String, time: String, UVI: Int, AQI: Int, status: Status) {
//        super.init(
//            id: id,
//            type: "cloudyLight",
//            location: location,
//            city: city,
//            time: time,
//            UVI: UVI,
//            AQI: AQI,
//            image: "cloud.sun.fill",
//            renderingMode: .multicolor,
//            symbolColor: [.primary, .primary],
//            gradient: [.brightGray, .darkSkyBlue],
//            status: status
//        )
//    }
//}
//
//class CloudyNightLight: AppWeather {
//    init(id: Int, location: String, city: String, time: String, UVI: Int, AQI: Int, status: Status) {
//        super.init(
//            id: id,
//            type: "cloudyNightLight",
//            location: location,
//            city: city,
//            time: time,
//            UVI: UVI,
//            AQI: AQI,
//            image: "cloud.moon.fill",
//            renderingMode: .hierarchical,
//            symbolColor: [.white, .white],
//            gradient: [.blueberry, .vistaBlue],
//            status: status
//        )
//    }
//}
//
//class NightLight: AppWeather {
//    init(id: Int, location: String, city: String, time: String, UVI: Int, AQI: Int, status: Status) {
//        super.init(
//            id: id,
//            type: "nightLight",
//            location: location,
//            city: city, time: time,
//            UVI: UVI,
//            AQI: AQI,
//            image: "moon.stars.fill",
//            renderingMode: .multicolor,
//            symbolColor: [.primary, .primary],
//            gradient: [.blueberry, .unitedNationsBlue],
//            status: status
//        )
//    }
//}
//
//class SunnyLight: AppWeather {
//    init(id: Int, location: String, city: String, time: String, UVI: Int, AQI: Int, status: Status) {
//        super.init(
//            id: id,
//            type: "sunnyLight",
//            location: location,
//            city: city,
//            time: time,
//            UVI: UVI,
//            AQI: AQI,
//            image: "sun.max.fill",
//            renderingMode: .multicolor,
//            symbolColor: [.primary, .primary],
//            gradient: [.cream, .skyBlue],
//            status: status
//        )
//    }
//}
//
//class RainLight: AppWeather {
//    init(id: Int, location: String, city: String, time: String, UVI: Int, AQI: Int, status: Status) {
//        super.init(
//            id: id,
//            type: "rainLight",
//            location: location,
//            city: city,
//            time: time,
//            UVI: UVI,
//            AQI: AQI,
//            image: "cloud.rain.fill",
//            renderingMode: .palette,
//            symbolColor: [.white, .mayaBlue],
//            gradient: [.lighterGray, .philippineGray],
//            status: status
//        )
//    }
//}
//
//class RainThunderLight: AppWeather {
//    init(id: Int, location: String, city: String, time: String, UVI: Int, AQI: Int, status: Status) {
//        super.init(
//            id: id,
//            type: "rainThunderLight",
//            location: location,
//            city: city,
//            time: time,
//            UVI: UVI,
//            AQI: AQI,
//            image: "cloudThunder",
//            renderingMode: .multicolor,
//            symbolColor: [.primary, .primary],
//            gradient: [.lighterGray, .philippineGray],
//            status: status
//        )
//    }
//}
//
////Open-Close Jen- status part
//
//class Status: Identifiable {
//    
//    var status: String
//    var statusColor: Color
//    var circleColor: Color
//    var textColor: Color
//    var UVInformation: [String]
//    var AQIInformation: [String]
//    var weatherInformation: [String]
//    var information: String
//    
//    init(status: String, statusColor: Color, circleColor: Color, textColor: Color, UVInformation: [String], AQIInformation: [String], weatherInformation: [String], information: String) {
//        self.status = status
//        self.statusColor = statusColor
//        self.circleColor = circleColor
//        self.textColor = textColor
//        self.UVInformation = UVInformation
//        self.AQIInformation = AQIInformation
//        self.weatherInformation = weatherInformation
//        self.information = information
//    }
//    
//}
//
//class StatusSafe: Status {
//    init() {
//        super.init(status: "Safe", statusColor: Color.paleGreen, circleColor: Color.paleGreenCircle, textColor: Color.paleGreenText, UVInformation: ["Low"], AQIInformation: ["Low"], weatherInformation: ["Cloudy", "Partly Cloudy"], information: "Conditions are favorable with no significant risks.")
//    }
//}
//
//class StatusUnsafe: Status {
//    init() {
//        super.init(status: "Unsafe", statusColor: Color.mauvelous, circleColor: Color.mauvelousCircle, textColor: Color.mauvelousText, UVInformation: ["Very High", "Extreme"], AQIInformation: ["Very Unhealthy", "Hazardous"], weatherInformation: ["Thunderstorm"], information: "Conditions are dangerous with high risks.")
//    }
//}
//
//class StatusCaution: Status {
//    init() {
//        super.init(status: "Caution", statusColor: Color.paleGoldenrod, circleColor: Color.paleGoldenrodCircle, textColor: Color.paleGoldenrodText, UVInformation: ["Moderate", "High"], AQIInformation: ["Moderate", "Sensitive", "Unhealthy"], weatherInformation: ["Mostly Sunny", "Light Rain", "HeavyRain"], information: "Conditions require some precautions due to moderate risks.")
//    }
//}
