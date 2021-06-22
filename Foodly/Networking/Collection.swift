//
//  Collection.swift
//  Foodly
//
//  Created by Decagon on 5.6.21.
//

import Foundation

enum Collection {
    case users
    case orderHistory
    
    var identifier: String {
        switch self {
        case .users:
            return "user"
        case .orderHistory:
            return "order_history"
        }
    }
    
}
