//
//  ContentView.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 10/07/24.
//

import SwiftUI
import MapKit

struct BookmarkPage: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            Task {
                //CLLocation(latitude: -6.301537874035788, longitude: 106.65296135054798)
//                await APService.shared.fetchAQForecastData(CLLocation(latitude: -6.301537874035788, longitude: 106.65296135054798))
                await APService.shared.processData((-6.301537874035788, 106.65296135054798))
            }
        }
    }
}

#Preview {
    BookmarkPage()
}
