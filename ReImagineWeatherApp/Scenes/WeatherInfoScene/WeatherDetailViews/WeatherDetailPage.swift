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
            VStack {
                Text("Green Office Park")
                    .font(.title3)
                    .bold()
                Text("Cisauk, Tangerang")
                    .font(.footnote)
                    .foregroundStyle(.arsenic)
                    .padding(.top, -10)
                    .padding(.bottom)
                
                
                ZStack {
                    
                    VStack (spacing: 15){
                        CalendarSelectionView()
                            .padding(.bottom, -10)
                        
                        Divider()
                            .padding(.horizontal)
                            
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 15) {
                                ForEach(0..<20) { _ in
                                    Rectangle()
                                        .frame(width: 52)
                                        .foregroundColor(.grayTertiary)
                                        .cornerRadius(15)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame(width: 361, height: 59)
                    }
                    .padding()
                }
                .frame(width: 361)
                .background(
                    Color.grayQuaternary2
                )
                .cornerRadius(30)
                .shadow(color: Color.black.opacity(0.2), radius: 9, x: 0, y: 5)
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
