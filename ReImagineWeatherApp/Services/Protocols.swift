//
//  Protocols.swift
//  Weather
//
//  Created by Stevans Calvin Candra on 15/07/24.
//

import Foundation

enum Pollutants: String {
    case CO = "CO"
    case NO2 = "NO2"
    case SO2 = "SO2"
    case PM2_5 = "PM2_5"
    case PM10 = "PM10"
}

protocol APServiceManagerProtocol {
    func fetchForecastData(_ coordinates: (lat: Double, lon: Double)) async -> AQDataModel
    func fetchPastData(_ coor: (lat: Double, lon: Double)) async -> AQDataModel
    func processData(_ coordinate: (lat: Double, lon: Double)) async
    func fetchHourData(_ coord: (lat: Double, lon: Double), _ date: Date) async -> APDataModel
}
