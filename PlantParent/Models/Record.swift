//
//  Record.swift
//  PlantParent
//
//  Created by Phil Wright on 11/13/22.
//

import Foundation

struct Record: Identifiable, Comparable {
    let id: UUID
    var date: Date
    private let formatter = DateFormatter()

    init(id: UUID = UUID(), date: String, dateFormat: String) {
        self.id = id
        formatter.dateFormat = dateFormat
        self.date = formatter.date(from: date) ?? Date()
    }

    init(id: UUID = UUID(), date: Date) {
        self.id = id
        self.date = date
    }

    static func < (lhs: Record, rhs: Record) -> Bool {
        return lhs.date < rhs.date
    }
}
