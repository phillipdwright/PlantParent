//
//  PlantsView.swift
//  PlantParent
//
//  Created by Phil Wright on 11/13/22.
//

import SwiftUI

struct PlantsView: View {
    @Binding var plants: [Plant]
    @State private var isPresentingNewPlantView = false
    @State private var newPlantData = Plant.EditData()
    var body: some View {
        List {
            ForEach($plants) { $plant in
                NavigationLink(destination: PlantDetailView(plant: $plant)) {
                    PlantCardView(plant: plant)
                }
            }
        }
        .navigationTitle("My Plants")
        .toolbar {
            Button(action: {
                isPresentingNewPlantView = true
            }) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $isPresentingNewPlantView) {
            NavigationView {
                PlantEditView(editData: $newPlantData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingNewPlantView = false
                                newPlantData = Plant.EditData()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Confirm") {
                                isPresentingNewPlantView = false
                                plants.append(Plant.from(data: newPlantData))
                                newPlantData = Plant.EditData()
                            }
                            .disabled(newPlantData.shouldBeDisabled)
                        }
                    }
            }
        }
    }
}

struct PlantsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PlantsView(plants: .constant(Plant.sampleData))
        }
    }
}
