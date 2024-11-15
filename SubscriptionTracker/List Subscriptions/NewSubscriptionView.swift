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
    
    var body: some View {
        NavigationStack {
            Form {
                /// Service selection
                Section("Select the service") {
                    Button(selectedService == nil ? "Select service" : selectedService!.name) {
                        showServiceSelection.toggle()
                    }
                }
                
                /// Frequency of the subscription
                Section {
                    Picker(selection: $selectedFrequency) {
                        ForEach(Frequency.allCases) { frequency in
                            Text(frequency.rawValue)
                        }
                    } label: {
                        Text("Frequency")
                    }
                }
                
                Text("Price")
                Text("Start date")
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
                        Text("Done")
                    }
                }
            }
        }
    }
}

#Preview {
    NewSubscriptionView()
}
