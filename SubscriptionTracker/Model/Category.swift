//
//  Category.swift
//  SubscriptionTracker
//
//  Created by Tiago Pereira on 15/11/24.
//

import Foundation

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
