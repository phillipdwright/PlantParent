//
//  PlantCardView.swift
//  PlantParent
//
//  Created by Phil Wright on 11/13/22.
//

import SwiftUI

struct PlantCardView: View {
    var plant: Plant

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(plant.name)
                    .font(.headline)
                Text("- \(plant.variety)")
            }
            Text(plant.location)
                .font(.caption)
            Spacer()
            if let nextWatering = plant.nextWatering {
                Label("Next watering", systemImage: "calendar")
                Text(nextWatering, style: .date)
            } else {
                Label("Never watered", systemImage: "calendar.badge.exclamationmark")
            }
        }
        .padding()
    }
}

struct PlantCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlantCardView(plant: Plant.sampleData[0])
            .previewLayout(.fixed(width: 400, height: 120))
    }
}
