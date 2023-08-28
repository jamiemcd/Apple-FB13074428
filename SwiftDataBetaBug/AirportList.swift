//
//  ContentView.swift
//  SwiftDataBetaBug
//
//  Created by Jamie McDaniel on 8/27/23.
//

import SwiftUI
import SwiftData

struct AirportList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var airports: [Airport]

    var body: some View {
        NavigationStack {
            if airports.isEmpty {
                ContentUnavailableView {
                    Button {
                        populateAirports()
                    } label: {
                        Text("Populate airports")
                    }
                    .buttonStyle(.borderedProminent)
                }
            } else {
                List(airports) { airport in
                    NavigationLink(value: airport) {
                        Text(airport.name)
                    }
                }
                .navigationDestination(for: Airport.self) { airport in
                    AirportView(airport: airport)
                }
                .navigationDestination(for: Airplane.self) { airplane in
                    AirplaneView(airplane: airplane)
                }
            }
        }
    }

    private func populateAirports() {
        withAnimation {
            let den = Airport(code: "DEN", name: "Denver International Airport", airPlanes: [
                Airplane(name: "A123", type: .boeing737, state: .departing),
                Airplane(name: "A456", type: .boeing737, state: .departing)])
            let mia = Airport(code: "MIA", name: "Miami International Airport", airPlanes: [
                Airplane(name: "B123", type: .boeing737Max, state: .departing),
                Airplane(name: "B456", type: .boeing737Max, state: .departing)])
            modelContext.insert(den)
            modelContext.insert(mia)
        }
    }


    

}

#Preview {
    AirportList()
        .modelContainer(for: Airport.self, inMemory: true)
}
