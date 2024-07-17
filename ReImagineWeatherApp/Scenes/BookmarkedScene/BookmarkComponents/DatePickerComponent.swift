//
//  DatePickerComponent.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//
import SwiftUI

struct DatePickerComponent: View {
    @State var selected: Bool

    let daySymbol: String
    let day: Int
    let isPast: Bool
    var safetyStatusColor: Color
    
    var body: some View {
        VStack(spacing: 10) {
            Text(daySymbol)
                .font(.caption2)
                .shadow(radius: 4.5)
                .foregroundColor(isPast ? .gray : .primary)
            
            ZStack {
                switch selected {
                case true:
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.grayTertiary)
                    Text("\(day)")
                        .font(.footnote)
                        .foregroundColor(isPast ? .gray : .primary)
                default:
                    Text("\(day)")
                        .font(.footnote)
                        .foregroundColor(isPast ? .gray : .primary)
                }
            }
            .frame(width: 22, height: 26)
            .shadow(radius: 4.5)
            
            Circle()
                .foregroundColor(isPast ? .gray : safetyStatusColor)
                .frame(width: 8)
                .shadow(radius: 4.5)
        }
        .frame(width: 22, height: 80)
    }
}
