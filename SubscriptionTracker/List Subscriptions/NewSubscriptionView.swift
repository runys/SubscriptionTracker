//
//  NewSubscriptionView.swift
//  SubscriptionTracker
//
//  Created by Tiago Pereira on 15/11/24.
//

import SwiftUI

struct NewSubscriptionView: View {
    
    @State var selectedService: Service?
    
    var body: some View {
        NavigationStack {
            ServiceSelectionView(selectedService: $selectedService)
        }
    }
}

struct NewSubscriptionView1: View {
    
    @State var selectedFrequency: Frequency = .monthly
    @State var price: Double = 0.0
    @State var startDate: Date = .now
    @State var isActive: Bool = true
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker(selection: $selectedFrequency) {
                        ForEach(Frequency.allCases) { frequency in
                            HStack {
                                Image(systemName: "circle")
                                    .symbolVariant(selectedFrequency == frequency ? .fill : .none)
                                Text(frequency.rawValue)
                            }
                        }
                    } label: { EmptyView() }
                        .pickerStyle(.inline)
                    
                } header: { Text("Frequency") }
                
                Text("Price")
                Text("Start date")
            }
            
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        // validate form
                        // create and close
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
    }
}
