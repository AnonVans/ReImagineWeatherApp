//
//  DatePickerComponent.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import SwiftUI

struct DatePickerComponent: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("F")
                .font(.caption2)
                .shadow(radius: 10)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 22, height: 26)
                    .foregroundColor(.grayTertiary)
                .shadow(radius: 10)
                
                Text("12")
                    .font(.footnote)
            }
            
            Circle()
                .foregroundColor(Color.paleGreenCircle)
                .frame(width: 8)
                .shadow(radius: 10)
            
        }
        .frame(width: 22, height: 80)
    }
}

#Preview {
    DatePickerComponent()
}
