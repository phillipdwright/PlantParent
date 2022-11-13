//
//  PlantParentApp.swift
//  PlantParent
//
//  Created by Phil Wright on 11/13/22.
//

import SwiftUI

@main
struct PlantParentApp: App {
    var body: some Scene {
        WindowGroup {
            PlantDetailView(plant: Plant.sampleData[0])
        }
    }
}
