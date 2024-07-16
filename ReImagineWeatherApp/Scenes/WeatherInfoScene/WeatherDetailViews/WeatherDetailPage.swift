//
//  WeatherDetailPage.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import SwiftUI

struct WeatherDetailPage: View {
    var body: some View {
        ScrollView {
            VStack (spacing: 15){
                Text("Green Office Park")
                    .font(.title3)
                    .bold()
                Text("Cisauk, Tangerang")
                    .font(.footnote)
                    .foregroundStyle(.arsenic)
                    .padding(.top, -10)
                
                
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .frame(width: 22)
                                .foregroundColor(.grayTertiary)
                                .cornerRadius(10)
                        }
                    }
                }
                .frame(width: 361, height: 59)
                    
                Divider()
                
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .frame(width: 52)
                                .foregroundColor(.grayTertiary)
                                .cornerRadius(15)
                        }
                    }
                }
                .frame(width: 361, height: 59)
                
                Divider()
                    .padding(.bottom)
                
                
                Image(systemName: "cloud.sun.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240)
                    .symbolRenderingMode(.multicolor)
                    .padding(.bottom)
                
                Text("Partly Cloudy")
                    .font(.headline)
                Text("29°")
                    .font(.subheadline)
                    .padding(.bottom)
                
                VStack (spacing: 20){
                    Rectangle()
                        .frame(width: 361, height: 95)
                        .cornerRadius(20)
                    
                    ForEach(0..<3) { _ in
                        Rectangle()
                            .frame(width: 361, height: 109)
                            .cornerRadius(20)
                    }
                }
                .foregroundColor(.arsenic)
                
            }
            .padding()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.cream, .skyBlue]), startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    WeatherDetailPage()
}
