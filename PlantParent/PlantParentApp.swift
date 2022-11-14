//
//  PlantParentApp.swift
//  PlantParent
//
//  Created by Phil Wright on 11/13/22.
//

import SwiftUI

@main
struct PlantParentApp: App {
    var plants = Plant.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView {
                PlantsView(plants: plants)
            }
        }
    }
}
