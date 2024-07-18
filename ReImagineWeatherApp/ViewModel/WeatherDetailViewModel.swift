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
}
