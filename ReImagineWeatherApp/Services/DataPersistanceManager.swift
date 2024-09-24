//
//  DataPersistanceManager.swift
//  ReImagineWeatherApp
//
//  Created by Stevans Calvin Candra on 09/09/24.
//

import Foundation
import SwiftData

public class DataPersistanceManager {
    public static var shared = DataPersistanceManager()
    var container: ModelContainer
    var context: ModelContext

    init() {
        do {
            self.container = try ModelContainer(for: BookmarkedLocation.self)
            self.context = ModelContext(container)
        } catch {
            fatalError("Error initializing database container: \(error.localizedDescription)")
        }
    }
}
