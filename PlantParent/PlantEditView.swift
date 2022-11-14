//
//  PlantEditView.swift
//  PlantParent
//
//  Created by Phil Wright on 11/13/22.
//

import SwiftUI

struct PlantEditView: View {
    @Binding var editData: Plant.EditData
    var body: some View {
        Form {
            Section(header: Text("About")) {
                TextField("Name", text: $editData.name)
                TextField("Variety", text: $editData.variety)
                TextField("Location", text: $editData.location)
            }
            Section(header: Text("Watering")) {
                HStack {
                    Slider(value: $editData.waterFrequencyInDays, in: 1...30, step: 1) {
                        Text("Water frequency (days)")
                    }
                    Spacer()
                    Text("\(Int(editData.waterFrequencyInDays)) days")
                }
            }
            Section(header: Text("Notes")) {
                TextField("Notes", text: $editData.notes, axis: .vertical)
                    .frame(minHeight: 75, alignment: .top)
            }
        }
    }
}

struct PlantEditView_Previews: PreviewProvider {
    static var previews: some View {
        PlantEditView(editData: .constant(Plant.sampleData[0].editData))
    }
}
