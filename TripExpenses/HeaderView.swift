//
//  HeaderView.swift
//  TripExpenses
//

import SwiftUI

struct HeaderView: View {
    
    let trip: Trip
    
    var body: some View {
        Image(trip.image)
            .resizable()
            .scaledToFill()
            .frame(height: 200)
            .clipped()
            .accessibilityHidden(true)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 30)
                VStack(spacing: 8) {
                    Text(trip.budget.formatted(.currency(code: trip.currency)))
                        .font(.title.bold())
                        .accessibilityLabel(Text("Budget"))
                        .accessibilityValue(trip.budget.formatted(.currency(code: trip.currency).grouping(.never)))
                    VStack {
                        Text("AVAILABLE")
                            .font(.caption2.weight(.light))
                            .foregroundColor(.secondary)
                        Text(trip.availableMoney, format: .currency(code: trip.currency))
                            .font(.callout)
                    }
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Available"))
                    .accessibilityValue(trip.availableMoney.formatted(.currency(code: trip.currency).grouping(.never)))
                }
            }
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            HeaderView(trip: .paris)
                .preferredColorScheme(.light)
            HeaderView(trip: .paris)
                .preferredColorScheme(.dark)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
    
}
