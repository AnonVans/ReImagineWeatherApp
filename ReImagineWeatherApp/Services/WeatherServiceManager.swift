//
//  WeatherKitServiceManager.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import Foundation
import WeatherKit
import CoreLocation

class WeatherServiceManager {
    static let shared = WeatherServiceManager()
    private let weatherService = WeatherService.shared
    
    private var weatherData: Weather?
    
    func fetchWeather(for location: CLLocation) async {
        do {
            self.weatherData = try await weatherService.weather(for: location)
        } catch {
            print("Failed retrieving weather data: \(error.localizedDescription)")
        }
    }
    
    func fetchCurrentWeather(location loc: (lat: Double, lon: Double)) async -> ParentWeather {
        if weatherData == nil {
            let location = CLLocation(latitude: loc.lat, longitude: loc.lon)
            await self.fetchWeather(for: location)
        }
        
        let currWeather = self.weatherData!.currentWeather
        
        let date = currWeather.date
        let uv = currWeather.uvIndex.value
        let temp = Int(currWeather.temperature.value)
        let condition = currWeather.condition.rawValue
        
        var night: Bool {
            if date.formatAsHour() > 18 {
                return true
            }
            
            return false
        }
        
        switch currWeather.condition {
            case .cloudy, .mostlyCloudy, .partlyCloudy:
                if night {
                    let weatherObject = CloudyNight()
                    weatherObject.dateTime = date
                    weatherObject.UVI = uv
                    weatherObject.temp = temp
                    weatherObject.condition = condition
                    return weatherObject
                } else {
                    let weatherObject = CloudyNoon()
                    weatherObject.dateTime = date
                    weatherObject.UVI = uv
                    weatherObject.temp = temp
                    weatherObject.condition = condition
                    return weatherObject
                }
            case .drizzle, .heavyRain, .rain, .sunShowers:
                let weatherObject = RainnyDay()
                weatherObject.dateTime = date
                weatherObject.UVI = uv
                weatherObject.temp = temp
                weatherObject.condition = condition
                return weatherObject
                
            case .hurricane, .isolatedThunderstorms, .scatteredThunderstorms, .strongStorms, .thunderstorms, .tropicalStorm:
                let weatherObject = StormyDay()
                weatherObject.dateTime = date
                weatherObject.UVI = uv
                weatherObject.temp = temp
                weatherObject.condition = condition
                return weatherObject
                
            default:
                if night {
                    let weatherObject = ClearNight()
                    weatherObject.dateTime = date
                    weatherObject.UVI = uv
                    weatherObject.temp = temp
                    weatherObject.condition = condition
                    return weatherObject
                } else {
                    let weatherObject = SunnyDay()
                    weatherObject.dateTime = date
                    weatherObject.UVI = uv
                    weatherObject.temp = temp
                    weatherObject.condition = condition
                    return weatherObject
                }
            }
    }
    
    func fetchSpecificWeather(location loc: (lat: Double, lon: Double), date dt: Date) async -> ParentWeather {
        if weatherData == nil {
            let location = CLLocation(latitude: loc.lat, longitude: loc.lon)
            await self.fetchWeather(for: location)
        }
        
        let weathers = self.weatherData?.hourlyForecast.forecast
        var weatherData: HourWeather?
        
        for weather in weathers! {
            if weather.date == dt {
                weatherData = weather
                print("\(weather.date) || \(dt)")
            }
        }
        
        let uv = weatherData!.uvIndex.value
        let temp = Int(weatherData!.temperature.value)
        let condition = weatherData!.condition.rawValue
        
        var night: Bool {
            if dt.formatAsHour() > 18 {
                return true
            }
            
            return false
        }
        
        switch weatherData!.condition {
            case .cloudy, .mostlyCloudy, .partlyCloudy:
                if night {
                    let weatherObject = CloudyNight()
                    weatherObject.dateTime = dt
                    weatherObject.UVI = uv
                    weatherObject.temp = temp
                    weatherObject.condition = condition
                    return weatherObject
                } else {
                    let weatherObject = CloudyNoon()
                    weatherObject.dateTime = dt                    
                    weatherObject.UVI = uv
                    weatherObject.temp = temp
                    weatherObject.condition = condition
                    return weatherObject
                }
            case .drizzle, .heavyRain, .rain, .sunShowers:
                let weatherObject = RainnyDay()
                weatherObject.dateTime = dt
                weatherObject.UVI = uv
                weatherObject.temp = temp
                weatherObject.condition = condition
                return weatherObject
                
            case .hurricane, .isolatedThunderstorms, .scatteredThunderstorms, .strongStorms, .thunderstorms, .tropicalStorm:
                let weatherObject = StormyDay()
                weatherObject.dateTime = dt
                weatherObject.UVI = uv
                weatherObject.temp = temp
                weatherObject.condition = condition
                return weatherObject
                
            default:
                if night {
                    let weatherObject = ClearNight()
                    weatherObject.dateTime = dt
                    weatherObject.UVI = uv
                    weatherObject.temp = temp
                    weatherObject.condition = condition
                    return weatherObject
                } else {
                    let weatherObject = SunnyDay()
                    weatherObject.dateTime = dt
                    weatherObject.UVI = uv
                    weatherObject.temp = temp
                    weatherObject.condition = condition
                    return weatherObject
                }
            }
    }
    
    func fetchDaysWeathers(location loc: (lat: Double, lon: Double), date dt: Date) async -> [ParentWeather] {
        if weatherData == nil {
            let location = CLLocation(latitude: loc.lat, longitude: loc.lon)
            await self.fetchWeather(for: location)
        }
        
        let weathers = self.weatherData?.hourlyForecast.forecast
        
        let calendar = Calendar(identifier: .gregorian)
        let startOfDay = calendar.startOfDay(for: dt)
        let endOfDay = calendar.date(byAdding: .hour, value: 23, to: startOfDay)!
        
        var daysData = [ParentWeather]()
        
        for weather in weathers! {
            if weather.date >= startOfDay && weather.date <= endOfDay {
                await daysData.append(fetchSpecificWeather(location: loc, date: weather.date))
            }
        }
        
        return daysData
    }
}
