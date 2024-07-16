//
//  InformationDetailCard.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import SwiftUI

struct InformationDetailCard: View {
    
//    var status: Status
//    var dataType: String
//    var appWeather: AppWeather
    
    var body: some View {
        
        VStack (alignment: .center, spacing: 10) {
//            Text(dataType)
            Text("Ini isi nya datatype")
                .font(.footnote)
                .bold()
            VStack {
                
                //ini ngambil information dari information model
//                let informationModel = Information(id: 0, range: "", level: "", information: "", type: "")
                    
                Text("ini for each buat nampilin uvi/aqi/weather")
//                switch dataType {
//                case "UVI":
//                    ForEach(appWeather.status.UVInformation, id: \.self) { info in
//                                            Text(info)
//                            .frame(width: 100)
//                    }
//                case "AQI":
//                    ForEach(appWeather.status.AQIInformation, id: \.self) { info in
//                                            Text(info)
//                            .frame(width: 100)
//                    }
//                case "Weather":
//                    ForEach(appWeather.status.weatherInformation, id: \.self) { info in
//                        Text(info)
//                            .frame(width: 100)
//                    }
//                default:
//                    Text("Information not available")
//                }
            }
            .font(.caption2)
            Spacer()
        }
        .frame(width: 100, height: 90)
        .padding(.top)
//        .background(
//            Color.grayTertiary
//        )
        .cornerRadius(20)
    }
}

//struct InformationDetailCard_Previews: PreviewProvider {
//    static var previews: some View {
//        let status = StatusSafe()
//        let dataType = "UVI"
//        let appWeather = SunnyLight(id: 1, location: "Location", city: "City", time: "12:00", UVI: 5, AQI: 50, status: status)
//        return SafetyStatusDetailComponentView(status: status, dataType: dataType, appWeather: appWeather)
//    }
//}

//#Preview {
//    InformationDetailCard()
//}
