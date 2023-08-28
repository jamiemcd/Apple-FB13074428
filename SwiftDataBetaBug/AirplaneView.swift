//
//  AirplaneView.swift
//  SwiftDataBetaBug
//
//  Created by Jamie McDaniel on 8/27/23.
//

import SwiftUI
import SwiftData

struct AirplaneView: View {
    
    var airplane: Airplane

    var body: some View {
        VStack(spacing: 12) {
            Text(airplane.name)
            Image(systemName: airplane.state.imageSystemName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            Button {
                airplane.gotoNextState()
            } label: {
                Text("Next State")
            }
        }
    }

}
