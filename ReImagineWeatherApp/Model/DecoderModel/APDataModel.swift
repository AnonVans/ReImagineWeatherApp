//
//  AirPolutionModel.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 11/07/24.
//

import Foundation

struct PollutantComponent: Decodable {
    var co: Double = 0.0
    var no2: Double = 0.0
    var so2: Double = 0.0
    var pm2_5: Double = 0.0
    var pm10: Double = 0.0
}

struct PollutantData: Decodable {
    var components: PollutantComponent
    var dt: TimeInterval
    
    func getTimeStamp() -> Date {
        return Date.init(timeIntervalSince1970: dt)
    }
}

struct Coordinates: Decodable {
    var lon: Double
    var lat: Double
    
    func getCoordinate() -> (lat: Double, lon: Double) {
        return (self.lat, self.lon)
    }
}

struct AQDataModel: Decodable {
    var coord: Coordinates
    var list: [PollutantData]
    
    init(coord: Coordinates = Coordinates(lon: 0.0, lat: 0.0), list: [PollutantData] = [PollutantData]()) {
        self.coord = coord
        self.list = list
    }
}

struct APIndex {
    var level: Int = 0
    var value = 0.0
    var iHigh: Int = 0
    var iLow: Int = 0
    var cHigh: Double = 0
    var cLow: Double = 0
}

struct APDataModel {
    var timeStamp: Date
    var level: Int
    var aqi: Int
    
    init(timeStamp: Date = Date.now, level: Int = 0, aqi: Int = 25) {
        self.timeStamp = timeStamp
        self.level = level
        self.aqi = aqi
    }
}
