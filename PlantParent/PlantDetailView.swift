//
//  PlantDetailView.swift
//  PlantParent
//
//  Created by Phil Wright on 11/13/22.
//

import SwiftUI

struct PlantDetailView: View {
    @Binding var plant: Plant
    @State private var editData = Plant.EditData()
    @State private var isPresentingEditView = false

    var body: some View {
        List {
            Section(header: Text("About")) {
                HStack {
                    Label("Name", systemImage: "person.fill")
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text(plant.name)
                }
                HStack {
                    Label("Variety", systemImage: "leaf.fill")
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text(plant.variety)
                }
                HStack {
                    Label("Location", systemImage: "mappin.and.ellipse")
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text(plant.location)
                }
            }
            Section(header: Text("Watering")) {
                HStack {
                    Label("Water frequency", systemImage: "drop.fill")
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text("\(plant.waterFrequencyInDays) days")
                }
                HStack {
                    Label("Last watered", systemImage: "calendar.badge.clock")
                        .foregroundColor(.accentColor)
                    Spacer()
                    if let lastWatering = plant.lastWatering {
                        Text(lastWatering, style: .date)
                    } else {
                        Text("Never")
                    }
                }
                HStack {
                    Label("Next watering", systemImage: "calendar")
                        .foregroundColor(.accentColor)
                    Spacer()
                    if let nextWatering = plant.nextWatering {
                        Text(nextWatering, style: .date)
                    }
                }
                Label("Water now", systemImage: "calendar.badge.plus")
                    .font(.headline)
                    .foregroundColor(.accentColor)
            }
            if !plant.notes.isEmpty {
                Section(header: Text("Notes")) {
                    Text(plant.notes)
                        .frame(minHeight: 75, alignment: .top)
                }
            }
            if !plant.history.isEmpty {
                Section(header: Text("History")) {
                    ForEach(plant.historySortedByLatest) { record in
                        HStack {
                            Text("Watered")
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text(record.date, style: .date)
                        }
                    }
                }
            }
        }
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editData = plant.editData
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                PlantEditView(editData: $editData)
                    .navigationTitle(plant.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                isPresentingEditView = false
                                plant.update(from: editData)
                            }
                            .disabled(editData.shouldBeDisabled)
                        }
                    }
            }
        }
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PlantDetailView(plant: .constant(Plant.sampleData[0]))
        }
    }
}
