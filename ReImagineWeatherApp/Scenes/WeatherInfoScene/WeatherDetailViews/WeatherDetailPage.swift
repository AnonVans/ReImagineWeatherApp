//
//  WeatherDetailPage.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import SwiftUI

struct WeatherDetailPage: View {
    var placeName: String
    var region: String
    var location: (lat: Double, lon: Double)
    
    var weatherDetailVM = WeatherDetailViewModel()
    
    @State var viewDidLoad = true
    @State var presentStatusSheet = false
    @State var presentUVSheet = false
    @State var presentAQSheet = false
    @State var presentWeatherSheet = false
    @State var weatherDetailData = ParentWeather()
    
    @State var date = DatePickerViewModel().resetDate(date: Date.now)
    @State var hour = DatePickerViewModel().getCurrentHour(date: Date.now)
    
    var body: some View {
        ZStack {
            if !viewDidLoad {
                WeatherDetailBackground(
                    startColor: weatherDetailData.gradientColor.startColor,
                    endColor: weatherDetailData.gradientColor.endColor
                )
            }
            
            VStack {
                VStack {
                    Text(placeName)
                        .font(.title3)
                        .bold()
                    
                    Text(region)
                        .font(.footnote)
                        .foregroundStyle(.arsenic)
                        .padding(.top, -10)
                        .padding(.bottom)
                    
                    ZStack {
                        VStack (spacing: 15){
                            CalendarSelectionView(selectedDay: $date)
                                .padding(.top, 10)
                            
                            Divider()
                                .padding(.horizontal)
                            
                            HourSelectionView(selectedDay: $hour)
                        }
                        .padding()
                    }
                    .frame(width: 361)
                    .background(
                        Color.grayQuaternary2
                    )
                    .cornerRadius(30)
                    .shadow(color: Color.black.opacity(0.2), radius: 9, x: 0, y: 5)
                    .padding(.bottom)
                }
                
                VStack {
                    if viewDidLoad {
                        Spacer()
                        
                        ProgressView()
                        
                        Spacer()
                    } else {
                        ScrollView {
                            VStack {
                                Image(systemName: weatherDetailData.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 240)
                                    .symbolRenderingMode(weatherDetailData.renderingMode)
                                    .padding(.bottom)
                                
                                Text(weatherDetailData.condition)
                                    .font(.headline)
                                
                                Text("\(weatherDetailData.temp)°")
                                    .font(.subheadline)
                                    .padding(.bottom)
                                
                                VStack (spacing: 20){
                                    SafetyCardComponent(
                                        status: weatherDetailData.getStatus(),
                                        uvType: weatherDetailData.getUVILevel(),
                                        aqiType: weatherDetailData.getAQILevel()
                                    )
                                    .onTapGesture {
                                        presentStatusSheet = true
                                    }
                                    .sheet(isPresented: $presentStatusSheet) {
                                        InformationDetailView(
                                            infoType: .SpecialData,
                                            data: SafetyInformation()
                                        )
                                        .ignoresSafeArea()
                                    }
                                    
                                    InformationDetailCard(
                                        infoType: .TextData,
                                        info: UVComponent().getInfoDetails(type: weatherDetailData.getUVILevel().rawValue),
                                        value: weatherDetailData.UVI
                                    )
                                    .onTapGesture {
                                        presentUVSheet = true
                                    }
                                    .sheet(isPresented: $presentUVSheet) {
                                        InformationDetailView(
                                            infoType: .TextData,
                                            data: UVInformation()
                                        )
                                        .ignoresSafeArea()
                                    }
                                    
                                    InformationDetailCard(
                                        infoType: .TextData,
                                        info: AQIComponent().getInfoDetails(type: weatherDetailData.getAQILevel().rawValue),
                                        value: weatherDetailData.AQI.aqi
                                    )
                                    .onTapGesture {
                                        presentAQSheet = true
                                    }
                                    .sheet(isPresented: $presentAQSheet) {
                                        InformationDetailView(
                                            infoType: .TextData,
                                            data: AQInformation()
                                        )
                                        .ignoresSafeArea()
                                    }
                                    
                                    InformationDetailCard(
                                        infoType: .ImageData,
                                        info: WeatherComponent().getInfoDetails(type: weatherDetailData.weatherType),
                                        value: -1
                                    )
                                    .padding(.bottom, 25)
                                    .onTapGesture {
                                        presentWeatherSheet = true
                                    }
                                    .sheet(isPresented: $presentWeatherSheet) {
                                        InformationDetailView(
                                            infoType: .ImageData,
                                            data: WeatherConditionInformation()
                                        )
                                        .ignoresSafeArea()
                                    }
                                }
                                .foregroundColor(.arsenic)
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                }
                .ignoresSafeArea()
                .padding(.top, 25)
                .frame(width: 361)
            }
            .onAppear {
                Task {
                    weatherDetailData = await weatherDetailVM.fetchHourWeatherData(
                        location: location,
                        dateTime: DatePickerViewModel().chooseDateHour(date: date, time: hour.formatAsHour()))
                    viewDidLoad = false
                }
            }
            .onChange(of: date) {
                viewDidLoad = true
                Task {
                    weatherDetailData = await weatherDetailVM.fetchHourWeatherData(
                        location: location,
                        dateTime: DatePickerViewModel().chooseDateHour(date: date, time: hour.formatAsHour()))
                    viewDidLoad = false
                }
            }
            .onChange(of: hour) {
                viewDidLoad = true
                Task {
                    weatherDetailData = await weatherDetailVM.fetchHourWeatherData(
                        location: location,
                        dateTime: DatePickerViewModel().chooseDateHour(date: date, time: hour.formatAsHour()))
                    viewDidLoad = false
                }
            }
        }
    }
}

#Preview {
    WeatherDetailPage(placeName: "Green Office Park", region: "Cisauk, Tangerang", location: (-6.301537874035788, 106.65296135054798))
}
