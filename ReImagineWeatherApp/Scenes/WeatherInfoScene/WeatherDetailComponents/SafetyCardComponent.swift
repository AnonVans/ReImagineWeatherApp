//
//  SafetyCardComponent.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import SwiftUI

//summarize information from all the weather aspect
struct SafetyCardComponent: View {
    var content: String = "Conditions require precautions. UV index is moderate. AQI is unhealthy for sensitive groups"
    
    var body: some View {
        Text(content)
            .foregroundStyle(.mauvelousText)
            .padding()
            .font(.system(size: 16))
            .multilineTextAlignment(.center)
            .frame(width: 361, height: 95)
            .background {
                Color.mauvelous
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20)
                    )
                
            }
        
    }
}

#Preview {
    SafetyCardComponent()
}
