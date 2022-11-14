//
//  Plant.swift
//  PlantParent
//
//  Created by Phil Wright on 11/13/22.
//

import Foundation

struct Plant: Identifiable {
    let id: UUID
    var name: String
    var variety: String
    var location: String
    var waterFrequencyInDays: Int
    var notes: String
    var history: [Record]

    var lastWatering: Date? {
        guard let latestRecord = history.max() else { return nil }
        return latestRecord.date
    }
    var nextWatering: Date? {
        guard let lastWatering = lastWatering else { return nil }
        return Calendar.current.date(byAdding: .day, value: waterFrequencyInDays, to: lastWatering)
    }
    var historySortedByLatest: [Record] {
        history.sorted().reversed()
    }

    init(id: UUID = UUID(), name: String, variety: String, location: String, waterFrequencyInDays: Int, notes: String, history: [Record] = []) {
        self.id = id
        self.name = name
        self.variety = variety
        self.location = location
        self.waterFrequencyInDays = waterFrequencyInDays
        self.notes = notes
        self.history = history
    }
}

extension Plant {
    static var sampleData: [Plant] {
        return [
            Plant(name: "George", variety: "Sanseveria", location: "Living room end table", waterFrequencyInDays: 5, notes: "This one is a little etiolated and probably needs to be repotted.", history: [
                Record(date: "2022-11-06", dateFormat: "yyyy-MM-dd"),
                Record(date: "2022-11-13", dateFormat: "yyyy-MM-dd"),
                Record(date: "2022-11-01", dateFormat: "yyyy-MM-dd")
            ]),
            Plant(name: "Carl", variety: "Bird of Paradise", location: "Upstairs landing", waterFrequencyInDays: 7, notes: ""),
            Plant(name: "Serena", variety: "Stapelia gigantea", location: "Center kitchen cabinet", waterFrequencyInDays: 8, notes: "From Deb. Not sure whether it will do well here.", history: [
                Record(date: "2022-11-02", dateFormat: "yyyy-MM-dd"),
                Record(date: "2022-11-10", dateFormat: "yyyy-MM-dd"),
                Record(date: "2022-10-25", dateFormat: "yyyy-MM-dd")
            ])
        ]
    }
}
