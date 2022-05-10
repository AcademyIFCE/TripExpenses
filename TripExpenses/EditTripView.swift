//
//  EditTripView.swift
//  TripExpenses
//

import SwiftUI

struct EditTripView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var trip: Trip
    
    var body: some View {
        NavigationView {
            List {
                TextField("Name", text: $trip.name)
                Section("Budget") {
                    TextField("0", value: $trip.budget, format: .number)
                    Picker("Currency", selection: $trip.currency) {
                        ForEach(["BRL", "EUR", "USD"], id: \.self) { currency in
                            Text(currency)
                        }
                    }
                }
                Section("Dates") {
                    DatePicker("Start", selection: $trip.startDate, displayedComponents: .date)
                    DatePicker("End", selection: $trip.endDate, displayedComponents: .date)
                }
            }
            .navigationBarTitle("Edit Trip")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
    
}

struct EditTripView_Previews: PreviewProvider {
    static var previews: some View {
        EditTripView(trip: .constant(.paris))
    }
}
