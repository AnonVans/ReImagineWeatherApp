//
//  AirPolutionAPIService.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 11/07/24.
//

import Foundation

class APService: APServiceManagerProtocol {
    static let shared = APService()
    private var apData = [APDataModel]()
    private var locationCoor: (lat: Double, lon: Double) = (0.0, 0.0)
    private var allAirData = [PollutantData]()
    
    func fetchForecastData(_ coordinates: (lat: Double, lon: Double)) async -> AQDataModel{
        var request = URLRequest(
            url: URL(string: "https://api.openweathermap.org/data/2.5/air_pollution/forecast?lat=" + String(coordinates.lat) + "&lon=" + String(coordinates.lon) + "&appid=" + APIKeyHolder.apiKey)!
        )
        request.httpMethod = "GET"
       
        let decoder = JSONDecoder()
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let airData = try decoder.decode(AQDataModel.self, from: data)

            return airData
        } catch {
            print("Failed Retrieving Data: \(error.localizedDescription)")
        }
        
        return AQDataModel()
    }
    
    func fetchPastData(_ coor: (lat: Double, lon: Double)) async -> AQDataModel {
        let calender = Calendar(identifier: .gregorian)
        let currStartDate = calender.startOfDay(for: Date())
        
        let currDate = Int(calender.date(byAdding: .hour, value: -1, to: Date.now)!.timeIntervalSince1970)
        let startDate = Int(calender.date(byAdding: .day, value: -1, to: currStartDate)!.timeIntervalSince1970)
        
        var request = URLRequest(
            url: URL(string: "https://api.openweathermap.org/data/2.5/air_pollution/history?lat=" + String(coor.lat) + "&lon=" + String(coor.lon) + "&start=" + String(startDate) + "&end=" + String(currDate) + "&appid=" + APIKeyHolder.apiKey)!
        )
        request.httpMethod = "GET"
       
        let decoder = JSONDecoder()
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let airData = try decoder.decode(AQDataModel.self, from: data)

            return airData
        } catch {
            print("Failed Retrieving Data: \(error.localizedDescription)")
        }
        
        return AQDataModel()
    }
    
//    func checkData() {
//        for datum in apData {
//            print("ts: \(datum.timeStamp.formatted())\naqi: \(datum.aqi)\nlevel:\(datum.level)")
//        }
//    }
    
    func processData(_ coordinate: (lat: Double, lon: Double)) async {
        var aqdata = [PollutantData]()
        
        let pastData = await fetchPastData(coordinate)
        let forecastData = await fetchForecastData(coordinate)
        
        aqdata = pastData.list + forecastData.list
        self.allAirData = aqdata
        
        for data in aqdata {
            let aqiObj = calculateAQI(data.components)
            
//            print("lvl: \(aqiObj.lvl) || val: \(aqiObj.aqi)")
            
            self.apData.append(APDataModel(timeStamp: data.getTimeStamp(), level: aqiObj.lvl, aqi: aqiObj.aqi))
        }
        
//        checkData()
    }
    
    func fetchHourData(_ coord: (lat: Double, lon: Double), _ date: Date) async -> APDataModel {
        if self.apData.isEmpty {
            await processData(coord)
        }
        
        var hourAPData = APDataModel()
        
        for data in self.apData {
            if data.timeStamp == date {
                hourAPData = data
                break
            }
        }
        
        return hourAPData
    }
    
    func getPollutantIndex(_ type: Pollutants, _ value: Double) -> APIndex {
        let indexScheme: [String: [APIndex]] = [
            "CO" : [
                APIndex(level: 1, iHigh: 50, iLow: 0, cHigh: 4.4, cLow: 0),
                APIndex(level: 2, iHigh: 100, iLow: 51, cHigh: 9.4, cLow: 4.5),
                APIndex(level: 3, iHigh: 150, iLow: 101, cHigh: 12.4, cLow: 9.5),
                APIndex(level: 4, iHigh: 200, iLow: 151, cHigh: 15.4, cLow: 12.5),
                APIndex(level: 5, iHigh: 300, iLow: 201, cHigh: 30.4, cLow: 15.5),
                APIndex(level: 6, iHigh: 500, iLow: 301, cHigh: 50.4, cLow: 30.5)
            ],
            "NO2" : [
                APIndex(level: 1, iHigh: 50, iLow: 0, cHigh: 53, cLow: 0),
                APIndex(level: 2, iHigh: 100, iLow: 51, cHigh: 100, cLow: 54),
                APIndex(level: 3, iHigh: 150, iLow: 101, cHigh: 360, cLow: 101),
                APIndex(level: 4, iHigh: 200, iLow: 151, cHigh: 649, cLow: 361),
                APIndex(level: 5, iHigh: 300, iLow: 201, cHigh: 1249, cLow: 650),
                APIndex(level: 6, iHigh: 500, iLow: 301, cHigh: 2049, cLow: 1250)
            ],
            "SO2" : [
                APIndex(level: 1, iHigh: 50, iLow: 0, cHigh: 35, cLow: 0),
                APIndex(level: 2, iHigh: 100, iLow: 51, cHigh: 75, cLow: 36),
                APIndex(level: 3, iHigh: 150, iLow: 101, cHigh: 185, cLow: 76),
                APIndex(level: 4, iHigh: 200, iLow: 151, cHigh: 304, cLow: 186),
                APIndex(level: 5, iHigh: 300, iLow: 201, cHigh: 604, cLow: 305),
                APIndex(level: 6, iHigh: 500, iLow: 301, cHigh: 1004, cLow: 605)
            ],
            "PM2_5" : [
                APIndex(level: 1, iHigh: 50, iLow: 0, cHigh: 15.4, cLow: 0),
                APIndex(level: 2, iHigh: 100, iLow: 1, cHigh: 40.4, cLow: 15.5),
                APIndex(level: 3, iHigh: 150, iLow: 101, cHigh: 65.4, cLow: 40.5),
                APIndex(level: 4, iHigh: 200, iLow: 151, cHigh: 150.4, cLow: 65.5),
                APIndex(level: 5, iHigh: 300, iLow: 201, cHigh: 250.4, cLow: 150.5),
                APIndex(level: 6, iHigh: 500, iLow: 301, cHigh: 500.4, cLow: 250.5)
            ],
            "PM10" : [
                APIndex(level: 1, iHigh: 50, iLow: 0, cHigh: 54, cLow: 0),
                APIndex(level: 2, iHigh: 100, iLow: 51, cHigh: 154, cLow: 55),
                APIndex(level: 3, iHigh: 150, iLow: 101, cHigh: 254, cLow: 155),
                APIndex(level: 4, iHigh: 200, iLow: 151, cHigh: 354, cLow: 255),
                APIndex(level: 5, iHigh: 300, iLow: 201, cHigh: 424, cLow: 355),
                APIndex(level: 6, iHigh: 500, iLow: 301, cHigh: 604, cLow: 425)
            ],
        ]
        
        let apIndexes = indexScheme[type.rawValue]!
        var apIndexScheme = APIndex()
        
        for apIndex in apIndexes {
            if apIndex.cHigh > value && apIndex.cLow < value {
                apIndexScheme = apIndex
            }
        }
        
        apIndexScheme.value = value
        
        return apIndexScheme
    }
    
    func getMainPolutant(_ pollutants: PollutantComponent) -> APIndex {
        var polLevels = [APIndex]()
        var polluteLevel = 0
        var mainPollutant = APIndex()
        
        let CO = Double(Int(pollutants.co))/1000.0
        
        let coIndex = getPollutantIndex(.CO, CO)
        let no2Index = getPollutantIndex(.NO2, pollutants.no2)
        let so2Index = getPollutantIndex(.SO2, pollutants.so2)
        let pm25Index = getPollutantIndex(.PM2_5, pollutants.pm2_5)
        let pm10Index = getPollutantIndex(.PM10, pollutants.pm10)
        
        polLevels.append(coIndex)
        polLevels.append(no2Index)
        polLevels.append(so2Index)
        polLevels.append(pm25Index)
        polLevels.append(pm10Index)
        
        for level in polLevels {
            if level.level > polluteLevel {
                mainPollutant = level
                polluteLevel = level.level
            }
        }
        
        return mainPollutant
    }
    
    func calculateAQI(_ pollutants: PollutantComponent) -> (lvl: Int, aqi: Int) {
        let mp = getMainPolutant(pollutants)
        
        let iDiff = Double(mp.iHigh - mp.iLow)
        let cDiff = Double(mp.cHigh - mp.cLow)
        let cValDiv = Double(mp.value - mp.cLow)
        
        return (mp.level, Int((iDiff / cDiff * cValDiv) + Double(mp.iLow)))
    }
    
    func calculateDayAQI(_ coord: (lat: Double, lon: Double), _ date: Date) async -> (lvl: Int, aqi: Int) {
        if self.apData.isEmpty {
            await processData(coord)
        }
        
        var dayAPData = APDataModel()
        
        let calendar = Calendar(identifier: .gregorian)
        let startOfDay = calendar.startOfDay(for: Date())
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)
        
        var componentSum = PollutantComponent()
        
        for data in allAirData {
            if data.dt >= startOfDay.timeIntervalSince1970 && data.dt < endOfDay!.timeIntervalSince1970 {
                componentSum.co += data.components.co
                componentSum.no2 += data.components.no2
                componentSum.so2 += data.components.so2
                componentSum.pm2_5 += data.components.pm2_5
                componentSum.pm10 += data.components.pm10
            }
        }
        
        componentSum.co = componentSum.co/24.0
        componentSum.no2 = componentSum.no2/24.0
        componentSum.so2 = componentSum.so2/24.0
        componentSum.pm2_5 = componentSum.pm2_5/24.0
        componentSum.pm10 = componentSum.pm10/24.0
        
        let mp = getMainPolutant(componentSum)
        
        let iDiff = Double(mp.iHigh - mp.iLow)
        let cDiff = Double(mp.cHigh - mp.cLow)
        let cValDiv = Double(mp.value - mp.cLow)
        
        return (mp.level, Int((iDiff / cDiff * cValDiv) + Double(mp.iLow)))
    }

}
