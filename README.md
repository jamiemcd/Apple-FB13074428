#  SwiftDataBetaBug

This project was created with Xcode 15 Beta 7. 

There are two SwiftData model classes: `Airport` and `Airplane`.

`Airplane.state` has three values: `.departing`, `.inFlight`, and `.landing`.

`Airport` has three computed properties: `numberOfAirplanesDeparting`, `numberOfAirplanesInFlight`, and `numberOfAirplanesLanding`. 
These three computed properties depend on `Airplane.state` (a stored property) so they should trigger observation.


## Steps to reproduce
1. Click on an airport. 
2. The `AirportView` will appear. 
3. Notice that the number of planes departing, in flight, and landing are correct.
4. Click on the button to land all planes.
5. Notice that the icons update, but the number of planes departing, in flight, and landing do not update.

## Expected behavior

The number of planes departing, in flight, and landing should update since they are computed properties that depend on airplane.state

## Actual behavior

The number of planes departing, in flight, and landing do not update.
