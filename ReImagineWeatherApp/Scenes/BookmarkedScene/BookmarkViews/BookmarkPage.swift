//
//  ContentView.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 10/07/24.
//

import SwiftUI
import MapKit

struct BookmarkPage: View {
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Weather")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding(.bottom)
                
                ZStack {
                    CalendarSelectionView()
                        .padding(.top)
                }
                .frame(width: 361)
                .background(
                    Color.grayQuaternary2
                )
                .cornerRadius(30)
                .shadow(color: Color.black.opacity(0.2), radius: 9, x: 0, y: 5)
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
                    .foregroundColor(.primary)
                    
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
}

struct CalendarSelectionView: View {
    @ObservedObject var calendarInfo = CalendarInformation()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 24) {
                
                ForEach(calendarInfo.dates.indices, id: \.self) { index in
                    let date = calendarInfo.dates[index]
                    let daySymbol = DateFormatter().shortWeekdaySymbols[Calendar.current.component(.weekday, from: date) - 1].prefix(1)
                    let day = Calendar.current.component(.day, from: date)
                    let isSelected = Calendar.current.isDate(calendarInfo.selectedDate, inSameDayAs: date)
                    let isPast = date < calendarInfo.startOfDay
                    let safetyStatusColor = calendarInfo.safetyStatus[index]
                    DatePickerComponent(daySymbol: String(daySymbol), day: day, isPast: isPast, selected: isSelected, safetyStatusColor: safetyStatusColor)
                        .onTapGesture {
                            calendarInfo.select(date: date)
                        }
                }
            }
            .padding(.horizontal)
        }
        .frame(width: 361, height: 61)
        .padding(.bottom)
    }
}
