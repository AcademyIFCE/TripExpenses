//
//  Expense.swift
//  TripExpenses
//

import Foundation

struct Expense: Identifiable {
    let id = UUID()
    var value: Double
    let date: Date
}
