//
//  CardOptions.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import Foundation

enum BankOptions: CaseIterable, Identifiable{
    var id: Self {return self}
    
    case Amex
    case Chase
    case Discover
    case CapitalOne
    case BOFA
    case WellsFargo
    case Citi
    case None
    
    var options: String {
        switch self {
            case .Amex:
                return "American Express"
            case .Chase:
                return "Chase"
            case .Discover:
                return "Discover"
            case .CapitalOne:
                return "Capital One"
            case .BOFA:
                return "Bank of America"
            case .WellsFargo:
                return "Wells Fargo"
            case .Citi:
                return "Citi"
            case .None:
                return "-"
        }
    }
    
}

