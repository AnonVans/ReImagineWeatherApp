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

    var body: some View {

        NavigationView {
                   VStack {
                       TextField("", text: $inputQuery, onCommit: {
                           searchLocation()
                           
                       })
                       .padding()
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .overlay(
                        Button(action: searchLocation){
                            HStack {
                                Image(systemName: "magnifyingglass")
                                Spacer()
                            }
                        }
                        
                            .padding(.horizontal, 22)
                            .foregroundColor(.gray)
                       )
                       
                       
                       List(searchResults, id: \.self) { result in
                           Button(action: {
                               selectLocation(result)
                           }) {
                               Text(result)
                           }
                       }

                       if let coordinates = viewModel.coordinatesFromAddress {
                           Text("Latitude: \(coordinates.latitude)")
                           Text("Longitude: \(coordinates.longitude)")
                       }

                       if let errorMessage = errorMessage {
                           Text(errorMessage).foregroundColor(.red)
                       }

                       Spacer()
                   }
                   .navigationBarTitle("Add Place", displayMode: .inline)
                   .navigationBarItems(leading: Button(action: {
                       // Action for back button
                   }) {
                       Image(systemName: "chevron.left")
                       Text("Back")
                   })
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

           private func selectLocation(_ location: String) {
               inputQuery = location
               viewModel.fetchCoordinates(from: location) { coordinates in
                   if let coordinates = coordinates {
                       DispatchQueue.main.async {
                           viewModel.locationServiceManager.coordinatesFromAddress = coordinates
                           errorMessage = nil
                       }
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
