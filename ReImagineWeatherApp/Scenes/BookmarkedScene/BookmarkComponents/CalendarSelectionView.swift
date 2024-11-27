//
//  CalendarSelectionView.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 18/07/24.
//

import SwiftUI

struct CalendarSelectionView: View {
    var calendarVM = DatePickerViewModel.shared
    
    var locations: [(lat: Double, lon: Double)]
    var today = DatePickerViewModel().resetDate(date: Date.now)
    @Binding var selectedDay: Date
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 35) {                
                ForEach(calendarVM.fetchDateSelection(date: today), id: \.self) { date in
                    DatePickerComponent(
                        selected: selectedDay,
                        daySymbol: String(DateFormatter().shortWeekdaySymbols[
                            Calendar.current.component(.weekday, from: date) - 1].prefix(3)),
                        day: date,
                        isPast: calendarVM.checkIsYesterday(today: today, check: date),
                        locations: locations
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
    }
}

//#Preview {
//    CalendarSelectionView(selectedDay: Date.now)
//}
