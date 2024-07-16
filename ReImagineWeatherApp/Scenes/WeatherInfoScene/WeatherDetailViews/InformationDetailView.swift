////
////  InformationDetailView.swift
////  ReImagineWeatherApp
////
////  Created by Stevans Calvin Candra on 16/07/24.
////
//
//import SwiftUI
//
//struct InformationDetailView: View {
//    var aqiInfo = AQIInformation(id: 0, range: "", level: "", information: "")
//    
//    var body: some View {
//        ScrollView {
//            
//            VStack {
//                HStack {
//                    Text("What is Air Quality Index?")
//                        .font(.title2)
//                        .bold()
//                    Spacer()
//                }
//            }
//            
//            InformationCardComponentView(Info: aqiInfo.generalInformation)
//                .padding(.bottom)
//            
//            HStack {
//                Text("AQI Level")
//                    .font(.title2)
//                    .bold()
//                Spacer()
//            }
//            
//            ForEach(aqiInfo.getAQIInformation(), id: \.range) { info in
//                LevelCardComponentView(aqiInfo: info)
//            }
//        }
//        .ignoresSafeArea()
//        .padding(20)
//    }
//}
//
//#Preview {
//    InformationDetailView()
//}
//
//struct InformationCardComponentView: View {
//    var Info = ""
//    
//    var body: some View {
//        ZStack {
//            VStack {
//                HStack {
//                    Text(Info)
//                        .font(.subheadline)
//                    Spacer()
//                }
//            }
//            .padding()
//        }
//        .frame(width: .infinity)
//        .background(
//            Color.grayTertiary
//        )
//        .cornerRadius(20)
//    }
//}
//
//struct LevelCardComponentView: View {
//    
//    var aqiInfo: AQIInformation
//    
//    var body: some View {
//        ZStack {
//            HStack(alignment: .top) {
//
//                VStack(alignment: .leading, spacing: 20) {
//                    HStack (alignment: .top) {
//                        Text("AQ Index: \(aqiInfo.range)")
//                            .font(.subheadline)
//                            .fontWeight(.bold)
//                        Spacer()
//                        Text("Level: \(aqiInfo.level)")
//                            .font(.subheadline)
//                            .fontWeight(.bold)
//                            
//                    }
//                    Text(aqiInfo.information)
//                        .foregroundColor(.primary)
//                        .font(.caption2)
//                }
//                .frame(width: .infinity)
//                
//                Spacer()
//                
//            }
//            .padding()
//            .background(Color.grayQuaternary)
//            .cornerRadius(20)
//            
//            
//            
//        }
//    }
//                                
//}
