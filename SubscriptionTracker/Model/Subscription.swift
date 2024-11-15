//
//  Subscription.swift
//  SubscriptionTracker
//
//  Created by imaginary institute on 17/09/24.
//

import Foundation

struct Subscription: Identifiable {
    var id: UUID = UUID()
    
    var service: Service
    
    var price: Double
    var startingDate: Date
    var frequency: Frequency
    
    var isActive: Bool = true
}

extension Subscription {
    
    static func testData() -> [Subscription] {
        let services = Service.testData()
        
        return [
            Subscription(service: services[0], price: 9.87, startingDate: .now, frequency: .monthly),
            Subscription(service: services[1], price: 10.0, startingDate: .now, frequency: .monthly),
            Subscription(service: services[2], price: 34.95, startingDate: .now, frequency: .monthly),
            Subscription(service: services[6], price: 18.9, startingDate: .now, frequency: .monthly),
            Subscription(service: services[7], price: 42.0, startingDate: .now, frequency: .monthly),
            Subscription(service: services[8], price: 16.9, startingDate: .now, frequency: .monthly),
            Subscription(service: services[9], price: 11.99, startingDate: .now, frequency: .monthly),
        ]
    }
    
}
