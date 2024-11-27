//
//  DatePickerComponent.swift
//  Weather
//
//  Created by Jennifer Luvindi on 16/07/24.
//

import SwiftUI

struct HourPickerComponent: View {
    var calendarVM = DatePickerViewModel.shared
    
    var selected: Date
    var hour: Date
    var loc: (lat: Double, lon: Double)
    
    @State var image: Image?
    
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
                
                if image == nil {
                    ProgressView()
                } else {
                    image!
                        .resizable()
                        .scaledToFit()
                        .symbolRenderingMode(.multicolor)
                }
            }
            .frame(width: 48, height: 43)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                Task {
                    image = await calendarVM.getWeatherImage(location: loc, date: hour)
                }
            }
        }
    }
}

#Preview {
    HourPickerComponent(selected: Date.now, hour: Date.now, loc: (-6.178356, 106.6301559))
}
