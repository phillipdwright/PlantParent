//
//  PlantDetailView.swift
//  PlantParent
//
//  Created by Phil Wright on 11/13/22.
//

import SwiftUI

struct PlantDetailView: View {
    var body: some View {
        List {
            Section(header: Text("About")) {
                HStack {
                    Label("Name", systemImage: "person.fill")
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text("George")
                }
                HStack {
                    Label("Variety", systemImage: "leaf.fill")
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text("Sempervivum")
                }
                HStack {
                    Label("Location", systemImage: "mappin.and.ellipse")
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text("Living room end table")
                }
            }
            Section(header: Text("Watering")) {
                HStack {
                    Label("Water frequency", systemImage: "drop.fill")
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text("7 days")
                }
                HStack {
                    Label("Last watered", systemImage: "calendar.badge.clock")
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text("November 13, 2022")
                }
                HStack {
                    Label("Next watering", systemImage: "calendar")
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text("November 15, 2022")
                }
                Label("Water now", systemImage: "calendar.badge.plus")
                    .font(.headline)
                    .foregroundColor(.accentColor)
            }
            Section(header: Text("Notes")) {
                Text("This one is a little etiolated and probably needs to be repotted.")
                    .frame(minHeight: 75, alignment: .top)
            }
            Section(header: Text("History")) {
                HStack {
                    Text("Watered")
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text("November 13, 2022")
                }
                HStack {
                    Text("Watered")
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text("November 6, 2022")
                }
            }
        }
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView()
    }
}
