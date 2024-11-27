////
////  InformationDetailView.swift
////  ReImagineWeatherApp
////
////  Created by Stevans Calvin Candra on 16/07/24.
////

import SwiftUI

struct InformationDetailView: View {
    var infoType: InfoType
    var data: WeatherDetailInformation
    
    var body: some View {
        ScrollView {
            
            VStack {
                HStack {
                    Text(data.infoTitle)
                        .font(.title2)
                        .bold()
                    Spacer()
                }
            }
            
            ZStack {
                VStack {
                    HStack {
                        Text(data.infoDescription)
                            .font(.subheadline)
                        Spacer()
                    }
                }
                .padding()
            }
            .frame(width: .infinity)
            .background(
                Color.grayTertiary
            )
            .cornerRadius(20)
            .padding(.bottom)
            
            HStack {
                Text(data.infoDetailTitle)
                    .font(.title2)
                    .bold()
                Spacer()
            }
            
            VStack(spacing: 25) {
                ForEach(data.getInfoDetails(), id: \.self) { detailData in
                    InformationCardComponent(infoType: infoType, data: detailData)
                }
            }
        }
        .ignoresSafeArea()
        .padding(20)
    }
}

#Preview {
    InformationDetailView(infoType: .SpecialData, data: SafetyInformation())
}
