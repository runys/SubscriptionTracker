//
//  ServiceSelectionView.swift
//  SubscriptionTracker
//
//  Created by Tiago Pereira on 15/11/24.
//

import SwiftUI

struct ServiceSelectionView: View {
    
    @Binding var selectedService: Service?
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        List {
            Section {
                Picker(selection: $selectedService) {
                    Section {
                        ForEach(Service.testData()) { service in
                            Label(service.name, systemImage: service.category.symbolName())
                                .tag(service)
                        }
                    }
                } label: {
                    EmptyView()
                }
                
                .pickerStyle(.inline)
                
                .onChange(of: selectedService) { _, _ in
                    dismiss()
                }
                
            }
            
            // TODO: Create the add new service view
            Section {
                Button {
                    // Navigate to the add new service view
                } label: {
                    Text("Add new service")
                }
            }
        }
        
    }
    
}

#Preview {
    
    @Previewable @State var selectedService: Service?
    
    ServiceSelectionView(selectedService: $selectedService)
        
        .overlay(alignment: .bottom) {
            Text("\(selectedService?.name ?? "Select a service")")
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.white)
                        .shadow(color: .black.opacity(0.2), radius: 10)
                )
                .padding()
                
        }
}
