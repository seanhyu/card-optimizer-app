//
//  Card.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import Foundation

// Struct for credit cards that stores all important information needed for the app

struct cardItem: Codable, Identifiable {
    let id: String
    let card: String
    let bank: String
    let joinDate: TimeInterval
    let food: Double
    let groceries: Double
    let travel: Double
    let gas: Double
    let everything: Double
    let fee: Int
    
}


