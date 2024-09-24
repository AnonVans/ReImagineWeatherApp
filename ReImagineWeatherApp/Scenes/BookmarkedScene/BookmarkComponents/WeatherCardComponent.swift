//////
//////  WeatherCardComponent.swift
//////  ReImagineWeatherApp
//////
//////  Created by Stevans Calvin Candra on 16/07/24.
//////

import SwiftUI

struct WeatherCardComponent: View {
    @State var weather = ParentWeather()
    @State var isLoading = true
    
    var placeName: String = ""
    var city: String = ""
    var location: (lat: Double, lon: Double)
    
    var weatherDetailVM = WeatherDetailViewModel()
    
    var body: some View {
        ZStack {
            if isLoading {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 361, height: 126)
                        .foregroundStyle(.grayQuaternary)
                    
                    ProgressView()
                }
            } else {
                VStack {
                    HStack (alignment: .top) {
                        VStack(alignment: .leading) {
                            Text(Date.now.formatAs24HourTimeNow())
                                .font(.caption)
                                .foregroundStyle(.arsenic)
                                .opacity(0.8)
                            
                            Text(placeName)
                                .font(.title3)
                                .bold()
                            
                            Text(city)
                                .font(.caption)
                                .foregroundStyle(.arsenic)
                                .opacity(0.8)
                        }
                        
                        Spacer()
                        
                        weather.getImage()
                            .symbolRenderingMode(weather.renderingMode)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 94, height: 62)
                            .foregroundStyle(
                                weather.imageColor.baseColor,
                                weather.imageColor.accentColor
                            )
                        
                    }
                    
                    HStack {
                        HStack {
                            Text(weather.getStatus().rawValue)
                                .font(.caption)
                                .foregroundStyle(weather.getStatus().textColor)
                                .frame(height: 16)
                                .padding(.horizontal, 10)
                                .background(weather.getStatus().backGroundColor)
                                .cornerRadius(10)
                            
                            Text(weather.getStatus().getStatusCondition())
                                .font(.caption2)
                                .frame(height: 16)
                                .padding(.trailing, 5)
                        }
                        .background(.grayQuaternary)
                        .cornerRadius(10)
                        
                        Spacer()
                    }
                    .padding(.top, 5)
                }
            }
        }
        .padding(.horizontal, 20)
        .frame(width: 361, height: 126)
        .background(
            weather.color
        )
        .cornerRadius(20)
        .onAppear {
            Task {
                weather = await weatherDetailVM.fetchCurrentWeatherData(
                    location: location,
                    dateTime: Date.now
                )
                
                isLoading = false
            }
        }
    }
}

#Preview {
    WeatherCardComponent(placeName: "Green Office Park", city: "Cisauk, Tangerang", location: (-6.178356, 106.6301559))
}
