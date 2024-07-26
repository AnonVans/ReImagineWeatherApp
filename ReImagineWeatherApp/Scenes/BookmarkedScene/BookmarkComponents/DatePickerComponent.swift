//
//  DatePickerComponent.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//
import SwiftUI

struct DatePickerComponent: View {
    var selected: Date
    var daySymbol: String
    var day: Date
    var isPast: Bool
    
    @State var safetyStatus: WeatherStatus?
    
    var calendarVM = DatePickerViewModel.shared
    var weatherVM = WeatherDetailViewModel()
    
    var locations: [(lat: Double, lon: Double)]
    
    var body: some View {
        VStack(spacing: 10) {
            Text(daySymbol)
                .font(.caption2)
                .shadow(radius: 4.5)
                .foregroundColor(isPast ? .gray : .primary)
            
            ZStack {
                if calendarVM.checkIsSelected(selected: selected, check: day) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.grayTertiary)
                }
                Text(day.formatAsAbbreviatedDay())
                    .font(.footnote)
                    .foregroundColor(isPast ? .gray : .primary)
            }
            .frame(width: 22, height: 26)
            .shadow(radius: 4.5)
            
            
            Circle()
                .foregroundColor(safetyStatus?.backGroundColor ?? .gray)
                .frame(width: 8)
                .shadow(radius: 4.5)
        }
        .frame(width: 30, height: 80)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                Task {
                    self.safetyStatus = await weatherVM.getStatusCondition(locations: locations, date: day)
                }
            }
        }
    }
}

