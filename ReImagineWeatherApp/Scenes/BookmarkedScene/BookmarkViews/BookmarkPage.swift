//
//  ContentView.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 10/07/24.
//

import SwiftUI
import MapKit
import SwiftData

struct BookmarkPage: View {
    @State var date = DatePickerViewModel().resetDate(date: Date.now)
    @State var locationsData = [BookmarkedLocation]()
    @State var locations = [(lat: Double, lon: Double)]()
    
    var bookmarkVM = BookmarkViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    CalendarSelectionView(
                        locations: locations,
                        selectedDay: $date
                    )
                        .padding(.top)
                }
                .frame(width: 361)
                .cornerRadius(30)
                .padding(.bottom)
                
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        SearchLocationView()
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                            Text("Add Place")
                                .font(.subheadline)
                                .padding(.leading, -5)
                        }
                        .padding(9)
                        .background(
                            Color.grayTertiary
                        )
                        .cornerRadius(40)
                        .frame(height: 28)
                    }
                }
                .padding(.top, 10)
                .padding(.bottom)
                .foregroundColor(.primary)
                
                NavigationStack {
                    ScrollView {
                        ForEach(locationsData) { data in
                            NavigationLink {
                                WeatherDetailPage(
                                    placeName: data.placeName,
                                    region: data.city, 
                                    locCoor: (data.latitude, data.longitude),
                                    isSaved: true,
                                    id: data.id
                                )
                            } label: {
                                WeatherCardComponent(
                                    placeName: data.placeName,
                                    city: data.city, 
                                    location: (data.latitude, data.longitude)
                                )
                            }
                        }
                    }
                    .frame(width: 361)
                }
                .ignoresSafeArea()
                .buttonStyle(PlainButtonStyle())
            }
            .navigationTitle("WeatherCare")
            .padding(.top)
            .padding(.horizontal)
            .onAppear {
                locationsData = bookmarkVM.fetchLocations()
                locations = bookmarkVM.fecthCoordinates(locations: locationsData)
            }
        }
    }
}

#Preview {
    BookmarkPage()
}
