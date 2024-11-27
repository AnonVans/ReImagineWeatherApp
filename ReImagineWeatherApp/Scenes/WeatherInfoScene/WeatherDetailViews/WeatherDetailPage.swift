//
//  WeatherDetailPage.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import SwiftUI

struct WeatherDetailPage: View {
    @Environment(\.dismiss) var dismiss
    
    var placeName: String
    var region: String
    var locCoor: (lat: Double, lon: Double)
    
    var weatherDetailVM = WeatherDetailViewModel()
    var isSaved = false
    var id = UUID()
    
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
                    weatherColor: weatherDetailData.color
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
                        .padding(.bottom)
                    
                    ZStack {
                        VStack (spacing: 5){
                            CalendarSelectionView(
                                locations: [(locCoor)],
                                selectedDay: $date
                            )
                            
                            Divider()
                                .padding(.horizontal)
                            
                            HourSelectionView(
                                loc: (locCoor),
                                selectedHour: $hour,
                                today: $date
                            )
                        }
                        .padding(10)
                    }
                    .frame(width: 361)
                    .background(
                        Color.calender
                    )
                    .cornerRadius(30)
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
                                weatherDetailData.getImage()
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 175)
                                    .symbolRenderingMode(weatherDetailData.renderingMode)
                                    .padding(.bottom)
                                
                                Text(weatherDetailData.condition)
                                    .font(.headline)
                                
                                Text("\(weatherDetailData.temp)°")
                                    .font(.subheadline)
                                    .padding(.bottom)
                                
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
                                .padding(.bottom, 32)
                                
                                VStack (spacing: 16){
                                    InformationDetailCard(
                                        infoType: .TextData, infoTitle: String(localized: "UV Index"),
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
                                    
                                    if weatherDetailData.AQI.aqi > -1 {
                                        InformationDetailCard(
                                            infoType: .TextData, infoTitle: String(localized: "Air Quality Index"),
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
                                    }
                                    
                                    InformationDetailCard(
                                        infoType: .ImageData, infoTitle: String(localized: "Weather Safety"),
                                        info: WeatherComponent().getInfoDetails(type: weatherDetailData.weatherType),
                                        value: -1
                                    )
                                    .padding(.bottom, 75)
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
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                }
                .ignoresSafeArea()
                .frame(width: 361)
            }
            .onAppear {
              Task {
                    weatherDetailData = await weatherDetailVM.fetchHourWeatherData(
                        location: locCoor,
                        dateTime: DatePickerViewModel().chooseDateHour(date: date, time: hour.formatAsHour()))
                    viewDidLoad = false
                }
            }
            .onChange(of: date) {
                viewDidLoad = true
                Task {
                    weatherDetailData = await weatherDetailVM.fetchHourWeatherData(
                        location: locCoor,
                        dateTime: DatePickerViewModel().chooseDateHour(date: date, time: hour.formatAsHour()))
                    viewDidLoad = false
                }
            }
            .onChange(of: hour) {
                viewDidLoad = true
                Task {
                    weatherDetailData = await weatherDetailVM.fetchHourWeatherData(
                        location: locCoor,
                        dateTime: DatePickerViewModel().chooseDateHour(date: date, time: hour.formatAsHour()))
                    viewDidLoad = false
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                if isSaved {
                    Button("Delete") {
                        weatherDetailVM.deleteLocation(id: id)
                        dismiss()
                    }
                } else {
                    Button("Save") {
                        weatherDetailVM.saveLocation(
                            placeName: placeName,
                            city: region,
                            loc: locCoor
                        )
                        dismiss()
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    WeatherDetailPage(placeName: "Green Office Park", region: "Cisauk, Tangerang", locCoor: (-6.178356, 106.6301559))
}
