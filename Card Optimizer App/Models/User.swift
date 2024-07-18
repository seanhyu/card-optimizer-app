//
//  User.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import Foundation

// struct for users that stores name, email, and date joined
struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
