////
////  Extentions.swift
////  ReImagineWeatherApp
////
////  Created by Stevans Calvin Candra on 16/07/24.
////

import SwiftUI

extension Image {
    var defaultStyle: some View {
        return self
                .frame(width: 20)
                .shadow(radius: 2)
    }
    
    var safeStatus: some View {
        return self
                .frame(width: 20)
                .foregroundColor(.paleGreenCircle)
                .shadow(radius: 2)
    }
    
    var cautionStatus: some View {
        return self
                .frame(width: 20)
                .foregroundColor(.paleGoldenrodCircle)
                .shadow(radius: 2)
    }
    
    var unsafeStatus: some View {
        return self
                .frame(width: 20)
                .foregroundColor(.mauvelousCircle)
                .shadow(radius: 2)
    }
    
    var clearDay: some View {
        return self
                .frame(width: 20)
                .foregroundColor(.clearDay)
    }
    
    var rainy: some View {
        return self
                .frame(width: 20)
                .foregroundColor(.rainy)
    }
    
    var clearNight: some View {
        return self
                .frame(width: 20)
                .foregroundColor(.clearNight)
    }
    
    var clearDayCard: some View {
        return self
                .font(.system(size: 72))
                .foregroundColor(.clearDay)
    }
    
    var rainyCard: some View {
        return self
                .font(.system(size: 72))
                .foregroundColor(.rainy)
    }
    
    var clearNightCard: some View {
        return self
                .font(.system(size: 72))
                .foregroundColor(.clearNight)
    }
    
    func statusTypeStyling(_ status: String) -> some View {
        switch status {
            case "Safe": return AnyView(safeStatus)
            case "Caution": return AnyView(cautionStatus)
            case "Unsafe": return AnyView(unsafeStatus)
            case "Clear Day Weather Safety": return AnyView(clearDay)
            case "Rainy Weather Safety": return AnyView(rainy)
            case "Clear Night Weather Safety": return AnyView(clearNight)
            default: return AnyView(defaultStyle)
        }
    }
    
    func cardTypeStyling(_ status: String) -> some View {
        switch status {
            case "ClearDay": return AnyView(clearDayCard)
            case "Rainny": return AnyView(rainyCard)
            case "ClearNight": return AnyView(clearNightCard)
            default: return AnyView(defaultStyle)
        }
    }
}

extension Date {
    func formatAsHour() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        return Int(dateFormatter.string(from: self))!
    }
    
    func formatAs24HourTimeNow() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH.mm"
        return dateFormatter.string(from: self)
    }

    func formatAsAbbreviatedDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: self)
    }
    
    func formatAsAbbreviatedTimeNow() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "ha"
        return formatter.string(from: self)
    }
    
    func formatAsAbbreviatedDayOfWeek() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: self)
    }
    
    func formatAsAbbreviatedTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "ha"
        return formatter.string(from: self)
    }
    func formatAsAbbreviatedDateIsActiveTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dH"
        return formatter.string(from: self)
    }
    func formatAsAbbreviatedDateIsActiveDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dE"
        return formatter.string(from: self)
    }
}
