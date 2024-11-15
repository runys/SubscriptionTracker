//
//  Subscription.swift
//  SubscriptionTracker
//
//  Created by imaginary institute on 17/09/24.
//

import Foundation

enum Frequency: String, CaseIterable {
    case weekly = "Weekly"
    case monthly = "Monthly"
    case yearly = "Yearly"
}

extension Frequency: Identifiable {
    var id: String {
        self.rawValue
    }
}

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

enum Category {
    case video
    case music
    case shopping
    case finance
    case transport
    case communication
    
    case other
    
    func symbolName() -> String {
        switch self {
        case .video:
            "tv"
        case .music:
            "music.quarternote.3"
        case .shopping:
            "cart"
        case .finance:
            "creditcard"
        case .transport:
            "bus"
        case .communication:
            "wifi.router"
        case .other:
            "sparkles"
        }
    }
}

struct Service: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    
    var category: Category
}

extension Service {
    
    static func testData() -> [Service] {
        [
            Service(name: "Netflix", category: .video),
            Service(name: "Amazon Prime", category: .video),
            Service(name: "Apple Music", category: .music),
            Service(name: "Apple One", category: .other),
            Service(name: "Apple TV+", category: .video),
            Service(name: "Crunchyroll", category: .video),
            Service(name: "Vodafone", category: .communication),
            Service(name: "UNICO", category: .transport),
            Service(name: "N26 Metal", category: .finance),
            Service(name: "YouTube", category: .video)
        ]
    }
    
}
