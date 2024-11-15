//
//  Service.swift
//  SubscriptionTracker
//
//  Created by Tiago Pereira on 15/11/24.
//

import Foundation

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
