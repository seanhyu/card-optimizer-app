//
//  Cards.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/24/24.
//

import Foundation

class Cards: ObservableObject {
    @Published var allOptions: [CardOption] = [
        CardOption(name: "Gold", defaultCashBack: 0.01,foodCashBack: 0.04,groceryCashBack: 0.04,travelCashBack: 0.03,gasCashBack: 0.01, bank:BankOptions.Amex),
        CardOption(name: "Platinum", defaultCashBack: 0.01, foodCashBack: 0.01,groceryCashBack: 0.01,travelCashBack: 0.05,gasCashBack: 0.01, bank:BankOptions.Amex),
        CardOption(name: "Green", defaultCashBack: 0.01, foodCashBack: 0.03,groceryCashBack: 0.01,travelCashBack: 0.03,gasCashBack: 0.01, bank:BankOptions.Amex),
        CardOption(name: "Freedom Flex", defaultCashBack: 0.01, foodCashBack: 0.03,groceryCashBack: 0.01,travelCashBack: 0.02, gasCashBack: 0.01, bank:BankOptions.Chase),
        CardOption(name: "Freedom Unlimited", defaultCashBack: 0.015, foodCashBack: 0.03,groceryCashBack: 0.015,travelCashBack: 0.02,gasCashBack: 0.015, bank:BankOptions.Chase),
        CardOption(name: "Sapphire Reserve", defaultCashBack: 0.01, foodCashBack: 0.03,groceryCashBack: 0.01,travelCashBack: 0.02,gasCashBack: 0.01, bank:BankOptions.Chase),
        CardOption(name: "Sapphire Preferred", defaultCashBack: 0.01, foodCashBack: 0.03,groceryCashBack: 0.01,travelCashBack: 0.02,gasCashBack: 0.01, bank:BankOptions.Chase),
        CardOption(name: "It", defaultCashBack: 0.01, foodCashBack: 0.01,groceryCashBack: 0.01,travelCashBack: 0.01,gasCashBack: 0.01, bank:BankOptions.Discover),
        CardOption(name: "Venture X Rewards", defaultCashBack: 0.02, foodCashBack: 0.02,groceryCashBack: 0.02,travelCashBack: 0.02,gasCashBack: 0.02, bank:BankOptions.CapitalOne),
        CardOption(name: "Venture Rewards", defaultCashBack: 0.02, foodCashBack: 0.02,groceryCashBack: 0.02,travelCashBack: 0.02,gasCashBack: 0.02, bank:BankOptions.CapitalOne),
        CardOption(name: "SavorOne", defaultCashBack: 0.01, foodCashBack: 0.03,groceryCashBack: 0.01,travelCashBack: 0.05,gasCashBack: 0.01, bank:BankOptions.CapitalOne),
        CardOption(name: "QuickSilver", defaultCashBack: 0.015, foodCashBack: 0.015,groceryCashBack: 0.015,travelCashBack: 0.015,gasCashBack: 0.015, bank:BankOptions.CapitalOne),
        CardOption(name: "Alaska Airlines", defaultCashBack: 0.01, foodCashBack: 0.01,groceryCashBack: 0.01,travelCashBack: 0.01,gasCashBack: 0.01, bank:BankOptions.BOFA),
        CardOption(name: "Bilt Mastercard", defaultCashBack: 0.01, foodCashBack: 0.03,groceryCashBack: 0.01,travelCashBack: 0.02,gasCashBack: 0.01, bank:BankOptions.WellsFargo),
        CardOption(name: "Double Cash", defaultCashBack: 0.02, foodCashBack: 0.02,groceryCashBack: 0.02,travelCashBack: 0.02,gasCashBack: 0.02, bank:BankOptions.Citi),
        CardOption(name: "Custom Cash", defaultCashBack: 0.01, foodCashBack: 0.01,groceryCashBack: 0.01,travelCashBack: 0.01,gasCashBack: 0.05, bank:BankOptions.Citi),
        CardOption(name: "Strata Premier", defaultCashBack: 0.01, foodCashBack: 0.03,groceryCashBack: 0.01,travelCashBack: 0.01,gasCashBack: 0.01, bank:BankOptions.Citi),
    ]
    

        
    
}
