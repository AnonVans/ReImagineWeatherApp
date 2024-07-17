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
    
    //create function to calculate safety status
}
