//
//  TripExpensesApp.swift
//  TripExpenses
//

import SwiftUI

@main
struct TripExpensesApp: App {
    var body: some Scene {
        WindowGroup {
            TripView(TripLogic(trip: .paris))
        }
    }
}
