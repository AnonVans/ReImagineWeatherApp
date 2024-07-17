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
        Text(status.getContent(uv: uvType, aqi: aqiType))
            .foregroundStyle(status.textColor)
            .padding()
            .font(.system(size: 16))
            .multilineTextAlignment(.center)
            .frame(width: 361)
            .background {
                status.backGroundColor
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20)
                    )
                
            }
    }
}

#Preview {
    SafetyCardComponent()
}
