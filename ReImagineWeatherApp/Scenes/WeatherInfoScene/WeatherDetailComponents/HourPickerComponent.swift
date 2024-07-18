//
//  DatePickerComponent.swift
//  Weather
//
//  Created by Jennifer Luvindi on 16/07/24.
//

import SwiftUI

struct HourPickerComponent: View {
    var selected: Date
    var hour: Date
    var imageName: String
    
    var calendarVM = DatePickerViewModel()
    
    var body: some View {
        ZStack{
            if calendarVM.checkSelectedHour(selected: selected, check: hour) {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 53, height: 60)
                    .foregroundColor(.grayTertiary)
            }
            
            VStack {
                Text(hour.formatAs24HourTimeNow())
                    .font(.caption)
                    .bold()
                Spacer()
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .symbolRenderingMode(.multicolor)
                    .shadow(radius: 1)
            }
            .frame(width: 48, height: 43)
        }
    }
}

#Preview {
    HourPickerComponent(selected: Date.now, hour: Date.now, imageName: "cloud.sun.fill")
}
