//
//  ServiceSelectionView.swift
//  SubscriptionTracker
//
//  Created by Tiago Pereira on 15/11/24.
//

import SwiftUI

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
