//
//  CalendarSelectionView.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 18/07/24.
//

import SwiftUI

struct CalendarSelectionView: View {
    var calendarVM = DatePickerViewModel()
    
    var today = DatePickerViewModel().resetDate(date: Date.now)
    @Binding var selectedDay: Date
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 25.5) {                
                ForEach(calendarVM.fetchDateSelection(date: today), id: \.self) { date in
                    DatePickerComponent(
                        selected: selectedDay,
                        daySymbol: String( DateFormatter().shortWeekdaySymbols[
                            Calendar.current.component(.weekday, from: date) - 1].prefix(1)),
                        day: date,
                        isPast: calendarVM.checkIsYesterday(today: today, check: date),
                        safetyStatusColor: calendarVM.getStatusColor()
                    )
                    .onTapGesture {
                        selectedDay = date
                    }
                }
            }
            .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
        .frame(width: 361, height: 61)
        .padding(.bottom)
//        .onAppear {
//            Task {
//                await WeatherServiceManager.shared.fetchSpecificWeather(location: (-6.301537874035788, 106.65296135054798), date: Calendar(identifier: .gregorian).startOfDay(for: Date()))
//            }
//        }
    }
}
//
//#Preview {
//    CalendarSelectionView()
//}
