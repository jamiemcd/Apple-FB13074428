//
//  Airplane.swift
//  SwiftDataBetaBug
//
//  Created by Jamie McDaniel on 8/27/23.
//

import Foundation
import SwiftData

@Model
final class Airplane {
    var name: String
    var type: AirplaneType
    var state: AirplaneState
    
    enum AirplaneType: Int, Codable {
        case boeing737
        case boeing737Max
        
        var name: String {
            switch self {
            case .boeing737:
                return "Boeing 737"
            case .boeing737Max:
                return "Boeing 737 Max"
            }
        }
    }
    
    enum AirplaneState: String, Codable, CaseIterable, Identifiable {
        case departing
        case inFlight
        case landing
        
        var id: Self { self }
        
        var imageSystemName: String {
            switch self {
            case .departing:
                "airplane.departure"
            case .inFlight:
                "airplane"
            case .landing:
                "airplane.arrival"
            }
        }
    }
    
    init(name: String, type: AirplaneType, state: AirplaneState) {
        self.name = name
        self.type = type
        self.state = state
    }
    
    func gotoNextState() {
        switch state {
        case .departing:
            state = .inFlight
        case .inFlight:
            state = .landing
        case .landing:
            state = .departing
        }
    }
}
