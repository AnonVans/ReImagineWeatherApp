//
//  WeatherDetailBackground.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 17/07/24.
//

import SwiftUI

struct WeatherDetailBackground: View {
    @State var startColor = Color.cream
    @State var endColor = Color.skyBlue
    
    var body: some View {
        LinearGradient(
            stops: [
                Gradient.Stop(color: startColor, location: 0.0),
                Gradient.Stop(color: endColor, location: 0.75)
            ],
            startPoint: .top, endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

#Preview {
    WeatherDetailBackground()
}
