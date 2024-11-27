//
//  WeatherDetailBackground.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 17/07/24.
//

import SwiftUI

struct WeatherDetailBackground: View {
    @State var weatherColor: Color
    
    var body: some View {
        weatherColor
            .ignoresSafeArea()
    }
}

#Preview {
    WeatherDetailBackground(weatherColor: .sunny)
}
