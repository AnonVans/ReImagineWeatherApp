//
//  SafetyDetailCard.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import SwiftUI

struct SafetyDetailCard: View {
    var details: (UV: String, AQ: String, Weather: String)
    
    var body: some View {
        HStack {
            VStack (alignment: .center) {
                Spacer()
                
                Text("UVI")
                    .font(.footnote)
                    .bold()
                
                Spacer()
                
                Text(details.UV)
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .frame(width: 95, height: 72)
            .background(
                Color.grayTertiary
            )
            .cornerRadius(20)
            
            VStack (alignment: .center) {
                Spacer()
                
                Text("AQI")
                    .font(.footnote)
                    .bold()
                
                Spacer()
                
                Text(details.AQ)
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .frame(width: 95, height: 72)
            .background(
                Color.grayTertiary
            )
            .cornerRadius(20)
            
            VStack (alignment: .center) {
                Spacer()
                
                Text("Weather")
                    .font(.footnote)
                    .bold()
                
                Spacer()
                
                Text(details.Weather)
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .frame(width: 95, height: 72)
            .background(
                Color.grayTertiary
            )
            .cornerRadius(20)
        }
    }
}

#Preview {
    SafetyDetailCard(details: ("Low", "Low", "Cloudy\nPartly Cloudy"))
}
