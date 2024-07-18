//
//  CalenderInformationViewModel.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 17/07/24.
//

import Foundation
import SwiftUI

class DatePickerViewModel: ObservableObject {
    let startOfDay: Date
    var dates: [Date] {
        let calendar = Calendar.current
        return (-1..<10).compactMap { dayOffset in
            calendar.date(byAdding: .day, value: dayOffset, to: startOfDay)
        }
    }
    
    //dummy safetyStatusData
    var safetyStatus: [Color] {
        [SafetyInformation().safe.CircleColor, SafetyInformation().safe.CircleColor, SafetyInformation().safe.CircleColor, SafetyInformation().unsafe.CircleColor, SafetyInformation().unsafe.CircleColor, SafetyInformation().unsafe.CircleColor, SafetyInformation().unsafe.CircleColor, SafetyInformation().caution.CircleColor, SafetyInformation().caution.CircleColor, SafetyInformation().caution.CircleColor, SafetyInformation().caution.CircleColor]
    }
    
    @Published var selectedDate: Date
    
    init() {
        let calendar = Calendar.current
        let now = Date()
        self.startOfDay = calendar.startOfDay(for: now)
        self.selectedDate = self.startOfDay
    }
    
    func select(date: Date) {
        if Calendar.current.isDate(selectedDate, inSameDayAs: date) {
            selectedDate = Calendar.current.startOfDay(for: Date())
        } else {
            selectedDate = date
        }
    }
    
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
        
        for i in -1...10 {
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
    
    //create function to calculate safety status
    func getStatusColor() -> Color {
        return .paleGreenCircle
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
    
    func getImageName() -> String {
        return "cloud.sun.fill"
    }
}
