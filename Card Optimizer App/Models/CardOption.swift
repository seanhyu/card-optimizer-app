//
//  CardOptions.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import Foundation


struct CardOption: Identifiable {
    let name: String
    let defaultCashBack: Double
    let foodCashBack: Double
    let groceryCashBack: Double
    let travelCashBack: Double
    let gasCashBack: Double
    let bank: BankOptions
    var id: String { name }
}




    

