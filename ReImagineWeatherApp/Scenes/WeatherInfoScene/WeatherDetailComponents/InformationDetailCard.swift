//
//  InformationDetailCard.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import SwiftUI

// information in the weather detail page
struct InformationDetailCard: View {
    var infoType: InfoType = .ImageData
    var info: ComponentInfo = WeatherComponent().getInfoDetails(type: WeatherType.ClearNight.rawValue)
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(info.componentTitle)
                        .font(.system(size: 17))
                        .bold()
                    Text(info.componentDescription)
                        .foregroundColor(.secondary)
                        .font(.system(size: 10))
                        .font(.subheadline)
                }
                .frame(width: 241)
                .padding(.vertical)
                .padding(.leading, 22.5)
                .frame(width: 275)
                
                Spacer()
                
                HStack(alignment: .center) {
                    if infoType == .TextData {
                        Text("\(20)")
                            .background(.grayTertiary)
                            .font(.system(size: 32))
                            .cornerRadius(30)
                    } else {
                        Image(systemName: info.componentImage)
                            .cardTypeStyling(info.componentType)
                    }
                }
                .frame(idealHeight: 105, maxHeight: 110)
                .padding(.trailing, 15)
            }
            .padding(.horizontal)
            .frame(maxWidth: 361, idealHeight: 109, maxHeight: 110)
            .background(.invertPrimary)
            .cornerRadius(20)
            .shadow(radius: 4)
        }
    }
}

#Preview {
    InformationDetailCard()
}
