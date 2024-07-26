//////
//////  WeatherCardComponent.swift
//////  ReImagineWeatherApp
//////
//////  Created by Stevans Calvin Candra on 16/07/24.
//////

import SwiftUI

struct WeatherCardComponent: View {
    var weather: ParentWeather
    
    var body: some View {
        
        ZStack{
            HStack {
                VStack{
                    HStack {
                        Text("Location")
                            .font(.title3)
                            .bold()
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("City")
                            .font(.footnote)
                            .foregroundStyle(.arsenic)
                            .opacity(0.8)
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    HStack{
                        Text("Time")
                        Text("UVI: \(weather.UVI)")
                        Text("AQI: \(weather.AQI.aqi)")
                        
                        Spacer()
                    }
                    .font(.caption)
                }
                .frame(width: 170, height: 83)
                .padding(.leading)

                Spacer()
                
                VStack {
                    weather.getImage()
                        .symbolRenderingMode(weather.renderingMode)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(
                            weather.imageColor.baseColor,
                            weather.imageColor.accentColor
                        )
                        .shadow(radius: 3)
                    
                    ZStack {
                        Text(weather.getStatus().rawValue)
                            .font(.caption)
                            .foregroundStyle(weather.getStatus().textColor)
                            .frame(width: 44, height: 16)
                            .padding()
                    }
                    .background(weather.getStatus().backGroundColor)
                    .frame(width: 58, height: 16)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                        
                }
                .frame(width: 88, height: 83)
                .padding(.trailing, 15)
            }
        }
        .frame(width: 361, height: 115)
        .background(
            LinearGradient(
                gradient:
                    Gradient(
                        colors: [
                            weather.gradientColor.startColor,
                            weather.gradientColor.endColor]
                    ),
                startPoint: .top, endPoint: .bottom
            )
        )
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.25), radius: 4.5, x: 0, y: 0)
        .padding(.vertical, 10)
    }
}

#Preview {
    WeatherCardComponent(weather: StormyDay())
}
