//
//  PlantsView.swift
//  PlantParent
//
//  Created by Phil Wright on 11/13/22.
//

import SwiftUI

struct PlantsView: View {
    var plants: [Plant]
    var body: some View {
        List {
            ForEach(plants) { plant in
                NavigationLink(destination: PlantDetailView(plant: plant)) {
                    PlantCardView(plant: plant)
                }
            }
        }
        .navigationTitle("My Plants")
    }
}

struct PlantsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PlantsView(plants: Plant.sampleData)
        }
    }
}
