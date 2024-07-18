//
//  Extensions.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import Foundation

// this extension allows us to enter credit cards to the firebase database as a dictionary
extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
        
    }
}
