//
//  Airport.swift
//  SwiftDataBetaBug
//
//  Created by Jamie McDaniel on 8/27/23.
//

import Foundation
import SwiftData

@Model
final class Airport {
    var code: String
    var name: String
    var airplanes: [Airplane]
    
    init(code: String, name: String, airPlanes: [Airplane]) {
        self.code = code
        self.name = name
        self.airplanes = airPlanes
    }
    
    // Bug: These three computed properties are not triggering observation in AirportView even though they depend on airplane.state
    var numberOfAirplanesDeparting: Int {
        var numberOfAirplanesDeparting = 0
        for airplane in airplanes {
            if airplane.state == .departing {
                numberOfAirplanesDeparting += 1
            }
        }
        return numberOfAirplanesDeparting
    }
    
    var numberOfAirplanesInFlight: Int {
        var numberOfAirplanesInFlight = 0
        for airplane in airplanes {
            if airplane.state == .inFlight {
                numberOfAirplanesInFlight += 1
            }
        }
        return numberOfAirplanesInFlight
    }
    
    var numberOfAirplanesLanding: Int {
        var numberOfAirplanesLanding = 0
        for airplane in airplanes {
            if airplane.state == .landing {
                numberOfAirplanesLanding += 1
            }
        }
        return numberOfAirplanesLanding
    }
    
}
