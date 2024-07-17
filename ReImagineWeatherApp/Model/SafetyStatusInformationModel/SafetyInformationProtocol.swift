//
//  SafetyInformationProtocol.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 17/07/24.
//

import Foundation

protocol SafetyInformationProtocol {
    var condition: String { get }
    var description: String { get }
    var additionalInfo: String { get }
}
