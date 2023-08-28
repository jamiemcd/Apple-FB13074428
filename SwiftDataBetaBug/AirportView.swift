//
//  AirportView.swift
//  SwiftDataBetaBug
//
//  Created by Jamie McDaniel on 8/28/23.
//

import SwiftUI

struct AirportView: View {
    
    var airport: Airport
    
    var body: some View {
        List {
            Section {
                ForEach(airport.airplanes) { airplane in
                    NavigationLink(value: airplane) {
                        HStack {
                            Image(systemName: airplane.state.imageSystemName)
                            VStack(alignment: .leading) {
                                Text(airplane.name)
                                Text(airplane.type.name)
                            }
                        }
                    }
                }
            } header: {
                Text(airport.name)
            } footer: {
                VStack(alignment: .leading) {
                    Text("Planes departing = \(airport.numberOfAirplanesDeparting)")
                    Text("Planes in flight = \(airport.numberOfAirplanesInFlight)")
                    Text("Planes landing = \(airport.numberOfAirplanesLanding)")
                }
            }
            ButtonSection(text: "Set all planes departing") {
                setAllPlanesToDeparting()
            }
            ButtonSection(text: "Set all planes in flight") {
                setAllPlanesToInFlight()
            }
            ButtonSection(text: "Set all planes landing") {
                setAllPlanesToLanding()
            }
        }
        .navigationTitle(airport.code)
        .navigationBarTitleDisplayMode(.inline)

    }
    
    private func setAllPlanesToDeparting() {
        for airplane in airport.airplanes {
            airplane.state = .departing
        }
    }
    
    private func setAllPlanesToInFlight() {
        for airplane in airport.airplanes {
            airplane.state = .inFlight
        }
    }
    
    private func setAllPlanesToLanding() {
        for airplane in airport.airplanes {
            airplane.state = .landing
        }
    }
}

private struct ButtonSection: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Section {
            HStack {
                Spacer()
                Button {
                    action()
                } label: {
                    Text(text)
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
        }
        .listRowBackground(Color.clear)
    }
}


