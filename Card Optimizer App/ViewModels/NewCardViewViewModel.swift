//
//  NewCardViewViewModel.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// ViewModel for the NewCardView
@Observable class NewCardViewViewModel {
    
    // instantiate and initialize variables for bank, card, and joinDate
    
    var bank = "American Express"
    var card = "-"
    var joinDate = Date()
    
    init() {
    }
    
    // instantiate variables for credit card earnings categories and set to default values
    
    var food = 0.01
    var groceries = 0.01
    var travel = 0.01
    var gas = 0.01
    var everything = 0.01
    var fee = 0
    
   
    // this function returns the card options based on the bank chosen 
    
    func options() -> Array<String> {
        switch bank {
        case "American Express":
            return ["Gold","Platinum","Green"]
        case "Chase":
            return ["Freedom Flex", "Freedom Unlimited", "Sapphire Preferred", "Sapphire Reserve"]
        case "Discover":
            return ["It"]
        case "Capital One":
            return ["Venture Rewards", "Venture X Rewards", "SavorOne", "QuickSilver"]
        case "Wells Fargo":
            return ["Bilt Mastercard"]
        case "Citi":
            return ["Double Cash","Custom Cash","Strata Premier"]
        default:
            return [""]
        }
        
    }
    
    // this function saves the newly added credit card to the user's "file" within the database and returns nothing
    
    func save() {
        
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        let newId = UUID().uuidString
        
        // assign default credit cards in scenario where user doesn't click on the default credit card choice
        
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
        // initiate variable for cardName equal to the concatenation of the bank name and card name
        let cardName = bank + " " + card
        
        // assign variables for card earnings rates based on credit card
        switch card {
            case "Gold":
                food = 0.04
                groceries = 0.04
                travel = 0.03
                gas = 0.01
                everything = 0.01
                fee = 325
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
        
        // create new Card for the new card with the supplied information
        
        let newItem = Card(
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
        
        
        // initiate variable db to the firebase database
        let db = Firestore.firestore()
        
        // save the newly added card to the database in the user's document
        db.collection("users")
            .document(uId)
            .collection("cards")
            .document(newId)
            .setData(newItem.asDictionary())
        
        
        
    }
    
}
