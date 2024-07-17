//
//  ComponentsProtocol.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 17/07/24.
//

import Foundation

class ComponentInfo {
    var componentTitle: String
    var componentDescription: String
    var componentImage: String
    var componentType: String
    
    init(componentTitle: String, componentDescription: String, componentImage: String, componentType: String) {
        self.componentTitle = componentTitle
        self.componentDescription = componentDescription
        self.componentImage = componentImage
        self.componentType = componentType
    }
}

protocol ComponentsProtocol {
    func populateData() -> [String : ComponentInfo]
    func getInfoDetails(type typeName: String) -> ComponentInfo
}
