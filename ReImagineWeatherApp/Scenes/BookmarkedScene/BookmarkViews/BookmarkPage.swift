//
//  ContentView.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 10/07/24.
//

import SwiftUI
import MapKit

struct BookmarkPage: View {
    
    @ObservedObject var calendarInfo = CalendarInformation()
    
    var body: some View {
        VStack {
            VStack (spacing: 15) {
                HStack {
                    Text("Weather")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding(.bottom)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 24) {
                        
                        ForEach(calendarInfo.dates, id: \.self) { date in
                            let daySymbol = DateFormatter().shortWeekdaySymbols[Calendar.current.component(.weekday, from: date) - 1].prefix(1)
                            let day = Calendar.current.component(.day, from: date)
                            let isSelected = Calendar.current.isDate(calendarInfo.selectedDate, inSameDayAs: date)
                            let isPast = date < calendarInfo.startOfDay
                            
                            DatePickerComponent(daySymbol: String(daySymbol), day: day, isPast: isPast, selected: isSelected)
                                .onTapGesture {
                                    calendarInfo.select(date: date)
                                }
                        }
                    }
                }
                .frame(width: 361, height: 59)
                .padding(.bottom)
                
                ScrollView {
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15)
                                Text("Add Place")
                                    .font(.subheadline)
                                    .padding(.leading, -5)
                            }
                            .padding(9)
                            .background(
                                Color.grayTertiary
                            )
                            .cornerRadius(40)
                            .frame(width: 107, height: 28)
                        })
                    }
                    .padding(.top, 10)
                    .padding(.bottom)
                    .foregroundColor(.black)
                    
                    VStack (spacing: 20) {
                        ForEach(0..<8) { _ in
                            Rectangle()
                                .frame(width: 361, height: 115)
                                .cornerRadius(20)
                        }
                    }
                    .foregroundColor(.arsenic)
                }
            }
            .ignoresSafeArea()
            .padding(.top)
            .padding(.horizontal)
        }
    }
}

#Preview {
    BookmarkPage()
}

class CalendarInformation: ObservableObject {
    let startOfDay: Date
    var dates: [Date] {
        let calendar = Calendar.current
        return (0..<11).compactMap { dayOffset in
            calendar.date(byAdding: .day, value: dayOffset, to: startOfDay)
        }
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
}
