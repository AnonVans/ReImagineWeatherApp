//
//  InformationCardComponent.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import SwiftUI

struct InformationCardComponent: View {
    var infoType: InfoType
    var data: InfoDetailCard
    
    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack (alignment: .center) {
                            Text(data.infoDetailName)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            if infoType == .TextData {
                                Text(data.infoDetailType)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                            } else {
                                Image(systemName: data.infoDetailType)
                                    .statusTypeStyling(data.infoDetailName)
                            }
                        }
                        Text(data.infoDetailDescription)
                            .foregroundColor(.primary)
                            .font(.caption2)
                    }
                    .padding(.horizontal, 10)
                    
                    if infoType == .SpecialData {
                        VStack(alignment: .center) {
                            switch data.infoDetailName {
                                case "Safe" : SafetyDetailCard(details: SafetyInformation().safe)
                                case "Caution" : SafetyDetailCard(details: SafetyInformation().caution)
                                default : SafetyDetailCard(details: SafetyInformation().unsafe)
                            }
                        }
                    }
                }
                .frame(width: .infinity)
                
                Spacer()
                
            }
            .padding()
            .background(Color.grayQuaternary)
            .cornerRadius(20)
        }
    }
}

#Preview {
    InformationCardComponent(infoType: .ImageData, data: InfoDetailCard.init(infoDetailName: "Safe", infoDetailType: "circle.fill", infoDetailDescription: "desc"))
}
