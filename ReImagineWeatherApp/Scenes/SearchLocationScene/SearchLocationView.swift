//
//  SearchLocationView.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 16/07/24.
//

import SwiftUI

struct SearchLocationView: View {
    private var viewModel = SearchLocationViewModel()
    @State private var inputQuery: String = ""
    @State private var inputAddress: String = ""
    @State private var errorMessage: String?
    @State private var searchResults: [String] = []
    @State private var locData: (city: String, region: String) = ("", "")
    
    @State var presentSheet = false
    @State var locCoor: (lat: Double, lon: Double) = (0.0, 0.0)
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(searchResults, id: \.self) { result in
                        Button(action: {
                            searchLocationData()
                            selectLocation(result)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                presentSheet.toggle()
                            }
                        }) {
                            Text(result)
                                .navigationDestination(isPresented: $presentSheet) {
                                    WeatherDetailPage(
                                        placeName: locData.city,
                                        region: locData.region,
                                        location: locCoor
                                    )
                                }
                        }
                    }
                }
                .searchable(text: $inputQuery)
                .onChange(of: inputQuery) { oldValue, newValue in
                    searchLocation()
                }
                
                Spacer()
            }
        }
    }
    
    private func searchLocation() {
        viewModel.searchLocations(query: inputQuery) { results in
            DispatchQueue.main.async {
                self.searchResults = results
                self.errorMessage = results.isEmpty ? "No locations found." : nil
            }
        }
    }
    
    private func searchLocationData() {
        viewModel.getLocData(query: inputQuery) { results in
            DispatchQueue.main.async {
                self.locData = results
            }
        }
    }
    
    private func selectLocation(_ location: String){
        inputQuery = location
        viewModel.fetchCoordinates(from: location) { coordinates in
            if let coordinate = coordinates {
                locCoor.lat = coordinate.latitude
                locCoor.lon = coordinate.longitude
            } else {
                    errorMessage = "Failed to geocode address."
            }
        }
    }
}

struct SearchLocationView_Previews: PreviewProvider {
    static var previews: some View {
        SearchLocationView()
    }
}
