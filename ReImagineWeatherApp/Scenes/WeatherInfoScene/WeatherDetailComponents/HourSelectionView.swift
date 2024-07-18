//
//  HourSelectionView.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 18/07/24.
//

import SwiftUI

struct HourSelectionView: View {
    var calendarVM = DatePickerViewModel()
    
    var today = DatePickerViewModel().resetDate(date: Date.now)
    @Binding var selectedDay: Date
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(calendarVM.fetchhourSelection(date: today), id: \.self) { hour in
                    HourPickerComponent(
                        selected: selectedDay,
                        hour: hour,
                        imageName: calendarVM.getImageName()
                    )
                    .onTapGesture {
                        selectedDay = hour
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
//    HourSelectionView()
//}
