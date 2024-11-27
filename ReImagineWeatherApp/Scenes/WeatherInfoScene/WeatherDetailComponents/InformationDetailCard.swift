//
//  InformationDetailCard.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import SwiftUI

// information in the weather detail page
struct InformationDetailCard: View {
    var infoType: InfoType
    var infoTitle: String?
    var info: ComponentInfo
    var value: Int
    
    var body: some View {
        VStack {
            HStack() {
                VStack(alignment: .leading, spacing: 8) {
                    Text(infoTitle ?? "error")
                        .font(.caption2)
                    
                    if infoType == .TextData {
                        Text("\(value)")
                            .font(.system(size: 32))
                            .bold()
                    } else {
                        Image(systemName: info.componentImage)
                            .cardTypeStyling(info.componentType)
                    }
                    
                    Text(info.componentTitle)
                        .font(.headline)
                        .bold()
                    
                    Text(info.componentDescription)
                        .font(.caption)
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
            .padding()
            .background(.groupBase)
            .foregroundStyle(.primary)
            .cornerRadius(20)
        }
    }
}

#Preview {
    InformationDetailCard(infoType: .ImageData, infoTitle: "AirQuality", info: WeatherComponent().getInfoDetails(type: WeatherType.ClearNight.rawValue), value: 20)
}
