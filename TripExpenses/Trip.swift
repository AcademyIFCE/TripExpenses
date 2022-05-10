//
//  Trip.swift
//  TripExpenses
//

import Foundation

struct Trip {
    
    var name: String
    var image: String
    var budget: Double
    var currency: String
    var startDate: Date
    var endDate: Date
    var expenses: [Expense]
    
    
    var availableMoney: Double {
        var moneySpent = 0.0
        for expense in expenses {
            moneySpent += expense.value
        }
        return budget - moneySpent
    }
    
}

extension Trip {
    
    static var paris = Trip(
        name: "Paris 2022",
        image: "paris",
        budget: 1000,
        currency: "EUR",
        startDate: Date(),
        endDate: Calendar.current.date(byAdding: .day, value: 10, to: Date())!,
        expenses: [
            Expense(value: 10, date: Date()),
            Expense(value: 50, date: Date()),
            Expense(value: 10, date: Date()),
            Expense(value: 100, date: Date()),
        ]
    )
    
}
