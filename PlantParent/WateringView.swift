//
//  WaterView.swift
//  PlantParent
//
//  Created by Phil Wright on 11/13/22.
//

import SwiftUI

struct WateringView: View {
    @Binding var date: Date

    var body: some View {
        VStack {
            DatePicker(selection: $date, in: ...Date(), displayedComponents: [.date]) {
                Text("Date of watering")
            }
            .datePickerStyle(.graphical)
            Button(action: {
                date = Date()
            }) {
                Text("Today")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

struct WateringView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WateringView(date: .constant(Date()))
        }
    }
}
