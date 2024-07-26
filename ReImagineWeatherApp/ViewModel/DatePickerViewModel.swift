//
//  CalenderInformationViewModel.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 17/07/24.
//

import Foundation
import SwiftUI

class DatePickerViewModel {
    let weatherService = WeatherServiceManager.shared
    let apService = APService.shared
    
    static let shared = DatePickerViewModel()
    
    var hourWeathers = [ParentWeather]()
    
    func resetDate(date dt: Date) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let preferedDate = calendar.startOfDay(for: dt)
        
        return preferedDate
    }
    
    func setInitDate(date dt: Date) -> Date {
        let hour = dt.formatAsHour()
        
        let calendar = Calendar(identifier: .gregorian)
        let baseDate = resetDate(date: dt)
        let preferedDate = calendar.date(byAdding: .hour, value: hour, to: baseDate)!
        
        return preferedDate
    }
    
    func chooseDateHour(date dt: Date, time hour: Int) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let baseDate = resetDate(date: dt)
        let preferedDate = calendar.date(byAdding: .hour, value: hour, to: baseDate)!
        
        return preferedDate
    }
    
    func fetchDateSelection(date dt: Date) -> [Date] {
        var dates = [Date]()
        
        let today = resetDate(date: dt)
        let calendar = Calendar(identifier: .gregorian)
        
        for i in 0...9 {
            dates.append(calendar.date(byAdding: .day, value: i, to: today)!)
        }
        
        return dates
    }
    
    func checkIsSelected(selected sDt: Date, check cDt: Date) -> Bool {
        let baseDate = resetDate(date: cDt)
        let compareDate = resetDate(date: sDt)
        
        if baseDate == compareDate {
            return true
        }
        
        return false
    }
    
    func checkIsYesterday(today tDt: Date, check cDt: Date) -> Bool {
        let baseDate = resetDate(date: cDt)
        let today = resetDate(date: tDt)
        
        if baseDate < today {
            return true
        }
        
        return false
    }
    
    func getCurrentHour(date dt: Date) -> Date {
        let baseDate = resetDate(date: dt)
        let hour = dt.formatAsHour()
        
        let calendar = Calendar(identifier: .gregorian)
        
        return calendar.date(byAdding: .hour, value: hour, to: baseDate)!
    }
    
    func fetchhourSelection(date dt: Date) -> [Date] {
        var hours = [Date]()
        
        let baseDate = resetDate(date: dt)
        let calendar = Calendar(identifier: .gregorian)
        
        for i in 0...23 {
            hours.append(calendar.date(byAdding: .hour, value: i, to: baseDate)!)
        }
        
        return hours
    }
    
    func checkSelectedHour(selected sh: Date, check ch: Date) -> Bool {
        let baseDate = sh.formatAsHour()
        let compareDate = ch.formatAsHour()
        
        if baseDate == compareDate {
            return true
        }
        
        return false
    }
    
    //create function to calculate safety status
    func getStatusColor() -> Color {
        return .paleGreenCircle
    }
    
    func getDaysWeather(location loc: (lat: Double, lon: Double), date dt: Date) async {
        let calendar = Calendar(identifier: .gregorian)
        let sod = calendar.startOfDay(for: dt)
        var curr = sod
        
        self.hourWeathers = await weatherService.fetchDaysWeathers(location: loc, date: dt)
        
        for hourWeather in hourWeathers {
            hourWeather.AQI = await apService.fetchHourData(loc, curr)
            curr = calendar.date(byAdding: .hour, value: 1, to: curr)!
        }
    }
    
    func checkWeather(date dt: Date) -> Bool {
        let calendar = Calendar(identifier: .gregorian)
        let sod = calendar.startOfDay(for: dt)
        
        if hourWeathers[0].dateTime == sod {
            return false
        }
        
        return true
    }
    
    func getWeatherImage(location loc: (lat: Double, lon: Double), date dt: Date) async -> Image {
        if self.hourWeathers.isEmpty || checkWeather(date: dt) {
            await getDaysWeather(location: loc, date: dt)
        }
        
        var weather: ParentWeather?
        
        for hourWeather in hourWeathers {
            if hourWeather.dateTime == dt {
                weather = hourWeather
            }
        }
        
        return weather?.getImage() ?? Image(systemName: "exclamationmark.triangle.fill")
    }
}
