////
////  SafetyStatusDetailView.swift
////  ReImagineWeatherApp
////
////  Created by Stevans Calvin Candra on 16/07/24.
////
//
//import SwiftUI
//
//struct SafetyStatusDetailView: View {
//    var body: some View {
//        ScrollView {
//            
//            VStack {
//                HStack {
//                    Text("What is Safety Status?")
//                        .font(.title2)
//                        .bold()
//                    Spacer()
//                }
//            }
//            
//            InformationCardComponentView(Info: "Safety Status is a system designed to inform individuals about the safety of outdoor conditions based on factors such as weather, UV index, and air quality. It helps people determine the level of precaution needed to stay safe and healthy when going outside.")
//                .padding(.bottom)
//            
//            HStack {
//                Text("Safety Status")
//                    .font(.title2)
//                    .bold()
//                Spacer()
//            }
//            
//            SafetyStatusCardComponentView( status: StatusSafe())
//            SafetyStatusCardComponentView( status: StatusCaution())
//            SafetyStatusCardComponentView( status: StatusUnsafe())
//        }
//        .ignoresSafeArea()
//        .padding()
//    }
//}
//
//#Preview {
//    SafetyStatusDetailView()
//}
//
//struct SafetyStatusCardComponentView: View {
//    
//    var dataType: String = ""
//    var status: Status
//    
//    var body: some View {
//        ZStack {
//            HStack(alignment: .top) {
//                
//                VStack(alignment: .leading, spacing: 20) {
//                    HStack (alignment: .top) {
//                        Text(status.status)
//                            .font(.subheadline)
//                            .fontWeight(.bold)
//                        Spacer()
//                        Circle()
//                            .frame(width: 20)
//                            .foregroundColor(status.circleColor)
//                            .shadow(radius: 2)
//                        
//                    }
//                    Text(status.information)
//                        .foregroundColor(.arsenic)
//                        .font(.caption)
//                    
//                    HStack {
//                        
//                        SafetyStatusDetailComponentView(status: status, dataType: "UVI")
//                        Spacer()
//                        
//                        SafetyStatusDetailComponentView(status: status, dataType: "AQI")
//                        Spacer()
//                        
//                        SafetyStatusDetailComponentView(status: status, dataType: "Weather")
//                        
//                    }
//                }
//                .padding()
//            }
//        }
//        .frame(width: .infinity)
//        .background(Color.grayQuaternary)
//        .cornerRadius(20)
//    }
//}
//
//struct SafetyStatusDetailComponentView: View {
//    
//    var status: Status
//    var dataType: String
//    
//    var body: some View {
//        
//        VStack (alignment: .center, spacing: 10) {
//            Text(dataType)
//                .font(.footnote)
//                .bold()
//            VStack {
//                switch dataType {
//                case "UVI":
//                    ForEach(status.UVInformation, id: \.self) { info in
//                        Text(info)
//                            .frame(width: 100)
//                    }
//                case "AQI":
//                    ForEach(status.AQIInformation, id: \.self) { info in
//                        Text(info)
//                            .frame(width: 100)
//                    }
//                case "Weather":
//                    ForEach(status.weatherInformation, id: \.self) { info in
//                        Text(info)
//                            .frame(width: 100)
//                    }
//                default:
//                    Text("Information not available")
//                }
//            }
//            .font(.caption2)
//            Spacer()
//        }
//        .frame(width: 100, height: 90)
//        .padding(.top)
//        .background(
//            Color.grayTertiary
//        )
//        .cornerRadius(20)
//    }
//}
