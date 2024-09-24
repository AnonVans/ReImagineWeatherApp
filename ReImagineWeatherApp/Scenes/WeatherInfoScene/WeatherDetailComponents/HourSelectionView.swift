//
//  HourSelectionView.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 18/07/24.
//

import SwiftUI

struct HourSelectionView: View {
    var calendarVM = DatePickerViewModel.shared
    
    var loc: (lat: Double, lon: Double)
    
    @Binding var selectedHour: Date
    @Binding var today: Date
    @State var didLoad = true
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(calendarVM.fetchhourSelection(date: today), id: \.self) { hour in
                    HourPickerComponent(
                        selected: selectedHour,
                        hour: hour,
                        loc: loc
                    )
                    .onTapGesture {
                        selectedHour = hour
                    }
                }
            }
            .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
        .frame(width: 361, height: 61)
        .onAppear {
            Task {
                await calendarVM.getDaysWeather(location: loc, date: today)
            }
        }
        .onChange(of: today) {
            Task {
                await calendarVM.getDaysWeather(location: loc, date: today)
            }
        }
    }
}

//#Preview {
//    HourSelectionView(loc: (-6.178356, 106.6301559), selectedDay: Date.now)
//}
