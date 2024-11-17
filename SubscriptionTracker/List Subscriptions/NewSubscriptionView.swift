//
//  NewSubscriptionView.swift
//  SubscriptionTracker
//
//  Created by Tiago Pereira on 15/11/24.
//

import SwiftUI

struct NewSubscriptionView1: View {
    
    @State var selectedService: Service?
    
    var body: some View {
        NavigationStack {
            ServiceSelectionView(selectedService: $selectedService)
        }
    }
}

struct NewSubscriptionView: View {
    
    @State private var selectedFrequency: Frequency = .monthly
    @State private var price: Double = 0.0
    @State private var startDate: Date = .now
    
    @State private var selectedService: Service?
    
    @State private var showServiceSelection: Bool = false
    
    @State private var numberFormatter: NumberFormatter = {
        var formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            Form {
                /// Service selection
                Section {
                    Button(selectedService == nil ? "Select service" : selectedService!.name) {
                        showServiceSelection.toggle()
                    }
                    .frame(maxWidth: .infinity)
                }
                
                /// Frequency of the subscription
                Section("Subscription Frequency") {
                    Picker(selection: $selectedFrequency) {
                        ForEach(Frequency.allCases) { frequency in
                            Text(frequency.rawValue)
                        }
                    } label: {
                        Text("Frequency")
                    }
                }
                
                /// Subscription price
                Section("Subscription Price") {
                    HStack {
                        Text("Price")
                        TextField("Price", value: $price, formatter: numberFormatter)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                    }
                    
                    //TODO: Add a currency selection
                }
                
                /// Starting date
                Section("Starting date") {
                    DatePicker("Starting date", selection: $startDate, displayedComponents: .date)
                }
            }
            .navigationTitle("New Subscription")
            
            .sheet(isPresented: $showServiceSelection) {
                ServiceSelectionView(selectedService: $selectedService)
            }
            
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        // validate form
                        // create and close
                    } label: {
                        Text("Add")
                    }
                }
            }
        }
    }
}

#Preview {
    NewSubscriptionView()
}
