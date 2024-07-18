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
    var info: ComponentInfo
    var value: Int
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(info.componentTitle)
                        .font(.system(size: 17))
                        .bold()
                    Text(info.componentDescription)
                        .foregroundColor(.secondary)
                        .font(.system(size: 12))
                        .font(.subheadline)
                }
                
                Spacer()
                
                if infoType == .TextData {
                    Text("\(value)")
                        .frame(width: 72, height: 85)
                        .background(.grayTertiary)
                        .font(.system(size: 32))
                        .cornerRadius(30)
                        .padding(.leading, 8)
                } else {
                    Image(systemName: info.componentImage)
                        .cardTypeStyling(info.componentType)
                }
            }
            .padding()
            .background(.invertPrimary)
            .cornerRadius(20)
            .shadow(radius: 4)
        }
    }
}

#Preview {
    InformationDetailCard(infoType: .TextData, info: WeatherComponent().getInfoDetails(type: WeatherType.ClearNight.rawValue), value: 20)
}
