//
//  WeatherDetailViewModel.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import Foundation
import SwiftData

class WeatherDetailViewModel {
    var apService = APService.shared
    var weatherService = WeatherServiceManager.shared
    var dataservice = DataPersistanceManager.shared
    
    func fetchCurrentWeatherData(location loc: (lat: Double, lon: Double), dateTime dt: Date) async -> ParentWeather {
        let calendar = Calendar(identifier: .gregorian)
        let sod = calendar.startOfDay(for: dt)
        let date = calendar.date(byAdding: .hour, value: dt.formatAsHour(), to: sod) ?? dt
        
        let data = await weatherService.fetchCurrentWeather(location: loc)
        data.AQI = await apService.fetchHourData(loc, date)
        
        return data
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
        
        switch levels.min() {
            case 1:
                return .Safe
            case 2:
                return .Caution
            default:
                return .Unsafe
        }
    }
    
    func saveLocation(placeName: String, city: String, loc: (lat: Double, lon: Double)) {
        let newLocation = BookmarkedLocation(placeName: placeName, city: city, latitude: loc.lat, longitude: loc.lon)
        dataservice.context.insert(newLocation)
    }
    
    func deleteLocation(id: UUID) {
        var locations = [BookmarkedLocation]()
        
        do {
            let fetchDescriptor = FetchDescriptor<BookmarkedLocation>()
            locations = try dataservice.context.fetch(fetchDescriptor)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
        for location in locations {
            if location.id == id {
                dataservice.context.delete(location)
                break
            }
        }
        
    }
}
