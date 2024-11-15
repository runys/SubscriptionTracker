//
//  SubscriptionListView.swift
//  SubscriptionTracker
//
//  Created by Tiago Pereira on 17/09/24.
//

import SwiftUI

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



#Preview {
    SubscriptionListView(subscriptions: Subscription.testData())
}
