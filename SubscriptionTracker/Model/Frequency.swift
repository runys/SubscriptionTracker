//
//  Frequency.swift
//  SubscriptionTracker
//
//  Created by Tiago Pereira on 15/11/24.
//


enum Frequency: String, CaseIterable {
    case weekly = "Weekly"
    case monthly = "Monthly"
    case yearly = "Yearly"
}

extension Frequency: Identifiable {
    var id: Frequency {
        self
    }
}
