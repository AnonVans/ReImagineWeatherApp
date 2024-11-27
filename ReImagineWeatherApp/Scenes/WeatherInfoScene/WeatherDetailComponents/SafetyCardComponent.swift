//
//  SafetyCardComponent.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import SwiftUI

//summarize information from all the weather aspect
struct SafetyCardComponent: View {
    var status: WeatherStatus = .Caution
    var uvType: UVIType = .Low
    var aqiType: AQIType = .Good
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(status.getStatusTitle())
                    .font(.headline)
                    .foregroundStyle(status.textColor)
                    .frame(height: 22)
                    .padding(.horizontal, 10)
                    .background(status.backGroundColor)
                    .cornerRadius(10)
                
                Text(status.getContent(uv: uvType, aqi: aqiType))
                    .font(.caption)
                    .foregroundStyle(.primary)
            }
            
            Spacer(minLength: 30)
            
            ZStack {
                Circle()
                    .frame(width: 32, height: 32)
                    .foregroundStyle(.grayTertiary)
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 17)
                    .bold()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.groupBase)
        }
    }
}

#Preview {
    SafetyCardComponent()
}
