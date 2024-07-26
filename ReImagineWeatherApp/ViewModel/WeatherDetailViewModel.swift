//
//  WeatherDetailViewModel.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import Foundation

class WeatherDetailViewModel {
    var apService = APService.shared
    var weatherService = WeatherServiceManager.shared
    
    func fetchCurrentWeather() {
        
    }
    
    func fetchHourWeatherData(location loc: (lat: Double, lon: Double), dateTime dt: Date) async -> ParentWeather {
        let data = await weatherService.fetchSpecificWeather(location: loc, date: dt)
        data.AQI = await apService.fetchHourData(loc, dt)
        
        return data
    }
    
    func calculateWeatherStatus(location loc: (lat: Double, lon: Double), date dt: Date) async -> Int {
        let calendar = Calendar(identifier: .gregorian)
        let sod = calendar.startOfDay(for: dt)
        
        let daysForecast = await weatherService.fetchDaysForecast(location: loc)
        let daysAQI = await apService.calculateDayAQI(loc, sod)
        let aqiLevel = AQIType.getLevel(AQIType.getType(daysAQI.aqi))
        
        var levels = [Int]()
        
        for dayForecast in daysForecast {
            if dayForecast.date == sod {
                let uvLevel = UVIType.getLevel(UVIType.getType(dayForecast.uv))
                
                levels.append(dayForecast.condition)
                levels.append(uvLevel)
                
//                print("\(aqiLevel) || \(dayForecast.condition) || \(uvLevel)")
            }
        }
        
        levels.append(aqiLevel)
        
        return levels.max()!
    }
    
    func getStatusCondition(locations locs: [(lat: Double, lon: Double)], date dt: Date) async -> WeatherStatus? {
        var levels = [Int]()
        
        for loc in locs {
            await levels.append(self.calculateWeatherStatus(location: loc, date: dt))
        }
        
//        print(levels.min()!)
        
        switch levels.min() {
            case 1:
                return .Safe
            case 2:
                return .Caution
            default:
                return .Unsafe
        }
    }
}
