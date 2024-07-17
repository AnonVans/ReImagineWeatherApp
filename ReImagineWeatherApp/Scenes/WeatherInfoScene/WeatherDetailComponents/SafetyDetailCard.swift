//
//  SafetyDetailCard.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import SwiftUI

struct SafetyDetailCard: View {
    var details: (UV: String, AQ: String, Weather: String, CircleColor: Color)
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack (alignment: .center) {
                Text("UVI")
                    .font(.footnote)
                    .bold()
                    .padding(.top, 12.5)
                    .padding(.bottom, 5)
                
                Text(details.UV)
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .frame(width: 95, height: 89)
            .background(
                Color.grayTertiary
            )
            .cornerRadius(20)
            
            Spacer()
            
            VStack (alignment: .center) {
                Text("AQI")
                    .font(.footnote)
                    .bold()
                    .padding(.top, 12.5)
                    .padding(.bottom, 5)
                
                Text(details.AQ)
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .frame(width: 95, height: 89)
            .background(
                Color.grayTertiary
            )
            .cornerRadius(20)
            Spacer()
            
            VStack (alignment: .center) {
                Text("Weather")
                    .font(.footnote)
                    .bold()
                    .padding(.top, 12.5)
                    .padding(.bottom, 5)
                
                Text(details.Weather)
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .frame(width: 95, height: 89)
            .background(
                Color.grayTertiary
            )
            .cornerRadius(20)
            
            Spacer()
        }
    }
}

#Preview {
    SafetyDetailCard(details: ("Low", "Low", "Cloudy\nPartly Cloudy", .mauvelousCircle))
}
