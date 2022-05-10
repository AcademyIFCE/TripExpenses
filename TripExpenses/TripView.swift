//
//  TripView.swift
//  TripExpenses
//

import SwiftUI

struct TripView: View {
    
    @FocusState private var focusedExpenseID: UUID?
    
    @State private var trip: Trip = .paris
    
    @State private var displayEditTripView = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HeaderView(trip: trip)
                expensesList
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(trip.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    navigationBarTrailingItemContent
                }
                ToolbarItem(placement: .bottomBar) {
                    bottomBarItemContent
                }
                ToolbarItem(placement: .keyboard) {
                    keyboardItemContent
                }
            }
            .sheet(isPresented: $displayEditTripView) {
                EditTripView(trip: $trip)
            }
        }
    }
    
    private var expensesList: some View {
        List {
            ForEach($trip.expenses) { $expense in
                HStack {
                    TextField("Expense", value: $expense.value, format: .currency(code: trip.currency))
                        .keyboardType(.decimalPad)
                        .focused($focusedExpenseID, equals: expense.id)
                    Spacer()
                    Text(expense.date.formatted())
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
            }
        }
        .listStyle(.plain)
    }
    
    private var navigationBarTrailingItemContent: some View {
        Button {
            displayEditTripView = true
        } label: {
            Label("Edit Trip", systemImage: "pencil")
        }
    }
    
    private var bottomBarItemContent: some View {
        HStack {
            Button {
                trip.expenses.insert(Expense(value: 0, date: Date()), at: 0)
                focusedExpenseID = trip.expenses.first?.id
            } label: {
                Label("New Expense", systemImage: "plus.circle.fill")
                    .labelStyle(.titleAndIcon)
                    .font(.system(.body, design: .rounded).weight(.medium))
            }
            Spacer()
        }
        .padding(.leading, -10)
    }
    
    private var keyboardItemContent: some View {
        HStack {
            Spacer()
            Button("Done") {
                focusedExpenseID = nil
            }
            .font(.body.bold())
        }
    }
    
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TripView()
                .previewDevice("iPhone 13")
            TripView()
                .previewDevice("iPhone SE (3rd generation)")
        }
        
    }
}

