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
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(plant.name)
                        .font(.headline)
                    Text(plant.variety)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(plant.location)
                }
            }
            Spacer()
            if let lastWatering = plant.lastWatering, let nextWatering = plant.nextWatering {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Last:")
                        Text(lastWatering, style: .date)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Next:")
                        Text(nextWatering, style: .date)
                    }
                }
                .font(.caption)
            } else {
                Text("Never watered")
                    .font(.caption)
            }
        }
        .padding()
    }
}

struct PlantCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlantCardView(plant: Plant.sampleData[0])
            .previewLayout(.fixed(width: 400, height: 80))
    }
}
