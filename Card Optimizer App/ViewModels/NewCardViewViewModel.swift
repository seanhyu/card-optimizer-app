//
//  NewCardViewViewModel.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewCardViewViewModel: ObservableObject {
    
    @Published var bank = "American Express"
    @Published var card = "-"
    @Published var joinDate = Date()
    
    init() {
        
    }
    @Published var amexOptions: [String] = ["Gold","Platinum","Green"]
    @Published var chaseOptions: [String] = ["Freedom Flex", "Freedom Unlimited", "Sapphire Preferred", "Sapphire Reserve"]
    @Published var discoverOptions: [String] = ["It"]
    @Published var capitalOneOptions: [String] = ["Venture Rewards", "Venture X Rewards", "SavorOne", "QuickSilver"]
    @Published var wfOptions: [String] = ["Bilt Mastercard"]
    @Published var citiOptions: [String] = ["Double Cash","Custom Cash","Strata Premier"]
    var food = 0.01
    var groceries = 0.01
    var travel = 0.01
    var gas = 0.01
    var everything = 0.01
    var fee = 0
    
   
    
    
    func options() -> Array<String> {
        switch bank {
        case "American Express":
            return amexOptions
        case "Chase":
            return chaseOptions
        case "Discover":
            return discoverOptions
        case "Capital One":
            return capitalOneOptions
        case "Wells Fargo":
            return wfOptions
        case "Citi":
            return citiOptions
        default:
            return [""]
        }
        
    }
    
    func save() {
        
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        if card == "-" {
            switch bank {
            case "American Express":
                card = "Gold"
            case "Chase":
                card = "Freedom Unlimited"
            case "Capital One":
                card = "Venture Rewards"
            case "Wells Fargo":
                card = "Bilt Mastercard"
            case "Citi":
                card = "Double Cash"
            case "Discover":
                card = "It"
            
            default:
                card = "-"
            }
        }
        let cardName = bank + " " + card
        
        switch card {
            case "Gold":
                food = 0.04
                groceries = 0.04
                travel = 0.03
                gas = 0.01
                everything = 0.01
                fee = 250
            case "Platinum":
                food = 0.01
                groceries = 0.01
                travel = 0.01
                gas = 0.01
                everything = 0.01
                fee = 695
            case "Green":
                food = 0.03
                groceries = 0.01
                travel = 0.03
                gas = 0.01
                everything = 0.01
                fee = 150
            case "Freedom Flex":
                food = 0.03
                groceries = 0.01
                travel = 0.02
                gas = 0.01
                everything = 0.01
                fee = 0
            case "Freedom Unlimited":
                food = 0.03
                groceries = 0.015
                travel = 0.02
                gas = 0.015
                everything = 0.015
                fee = 0
            case "Sapphire Reserve":
                food = 0.03
                groceries = 0.01
                travel = 0.02
                gas = 0.01
                everything = 0.01
                fee = 500
            case "Sapphire Preferred":
                food = 0.03
                groceries = 0.01
                travel = 0.02
                gas = 0.01
                everything = 0.01
                fee = 95
            case "It":
                food = 0.01
                groceries = 0.01
                travel = 0.01
                gas = 0.01
                everything = 0.01
                fee = 0
            case "Venture X Rewards":
                food = 0.02
                groceries = 0.02
                travel = 0.02
                gas = 0.02
                everything = 0.02
                fee = 395
            case "Venture Rewards":
                food = 0.02
                groceries = 0.02
                travel = 0.02
                gas = 0.02
                everything = 0.02
                fee = 95
            case "SavorOne":
                food = 0.03
                groceries = 0.03
                travel = 0.01
                gas = 0.01
                everything = 0.01
                fee = 0
            case "Bilt Mastercard":
                food = 0.03
                groceries = 0.01
                travel = 0.02
                gas = 0.01
                everything = 0.01
                fee = 0
            case "Double Cash":
                food = 0.02
                groceries = 0.02
                travel = 0.02
                gas = 0.02
                everything = 0.02
                fee = 0
            case "Custom Cash":
                food = 0.01
                groceries = 0.01
                travel = 0.01
                gas = 0.05
                everything = 0.01
                fee = 0
            case "Strata Premier":
                food = 0.03
                groceries = 0.01
                travel = 0.01
                gas = 0.01
                everything = 0.01
                fee = 95
            default:
                food = 0.01
                groceries = 0.01
                travel = 0.01
                gas = 0.01
                everything = 0.01
                fee = 0
        }
        
        let newItem = cardItem(
            id: newId,
            card: cardName,
            bank: bank,
            joinDate: joinDate.timeIntervalSince1970,
            food: food,
            groceries: groceries,
            travel: travel,
            gas: gas,
            everything: everything,
            fee: fee
        )
        
        
        // save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("cards")
            .document(newId)
            .setData(newItem.asDictionary())
        
        
        
    }
    
}
