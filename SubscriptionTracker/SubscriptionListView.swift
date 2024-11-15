//
//  SubscriptionListView.swift
//  SubscriptionTracker
//
//  Created by imaginary institute on 17/09/24.
//

import SwiftUI

struct SubscriptionRow: View {
    let subscription: Subscription
    
    var body: some View {
        HStack {
            Label(subscription.service.name, systemImage: subscription.service.category.symbolName())
            Spacer()
            Text(subscription.price, format: .currency(code: "EUR"))
        }
    }
}

struct ServiceSelectionView: View {
    
    @Binding var selectedService: Service?
    
    var body: some View {
        List {
            
            Section {
                if let selectedService {
                    Text(selectedService.name)
                        .frame(maxWidth: .infinity)
                } else {
                    Text("Selected service")
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("Selected service")
            }
            
            Section {
                Picker(selection: $selectedService) {
                    ForEach(Service.testData()) { service in
                        Label(service.name, systemImage: service.category.symbolName())
                            .tag(service)
                    }
                } label: {
                    //Text("Pick a service:")
                }
                .pickerStyle(.inline)
            }
            
            Section {
                Button {
                    //
                } label: {
                    Text("Add new service")
                }
            }
        }
    }
    
}

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

struct SubscriptionListView: View {
    
    @State var subscriptions: [Subscription]
    
    @State var showNewSubscriptionModal: Bool = false
    
    var body: some View {
        List {
            Section {
                Text(1000, format: .currency(code: "EUR"))
                    .font(.title).bold()
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            
            Section {
                ForEach(subscriptions) { subscription in
                    SubscriptionRow(subscription: subscription)
                }
            } header: {
                Text("Subscriptions")
            }
            
            Button {
                showNewSubscriptionModal.toggle()
            } label: {
                Text("Add new subscription")
            }
        }
        .sheet(isPresented: $showNewSubscriptionModal) {
            NewSubscriptionView()
            //ServiceSelectionView()
        }
    }
}

#Preview {
    SubscriptionListView(subscriptions: Subscription.testData())
}
