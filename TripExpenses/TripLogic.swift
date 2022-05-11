//
//  TripLogic.swift
//  TripExpenses
//
//  Created by Gabriela Bezerra on 11/05/22.
//

import Foundation

class TripLogic: ObservableObject {

    @Published var trip: Trip
    @Published var displayEditTripView = false
    
    init(trip: Trip) {
        self.trip = trip
    }
    
}

extension TripLogic {
    static var mock: TripLogic {
        TripLogic(trip: .paris)
    }
}
