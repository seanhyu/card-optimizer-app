//
//  CustomCardViewViewModel.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 7/15/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// ViewModel for the CustomCardView
class CustomCardViewViewModel: ObservableObject {
    
    // initiate variables for all card information to default values
    @Published var bank = ""
    @Published var card = ""
    @Published var joinDate = Date()
    @Published var showAlert = false
    @Published var food: Double = 0.01
    @Published var groceries: Double = 0.01
    @Published var travel: Double = 0.01
    @Published var gas: Double = 0.01
    @Published var everything: Double = 0.01
    @Published var fee = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    // function that attempts to save the new credit card and populates the errorMessage variable if it fails; returns nothing
    func save()  {
        
        // set errorMessage to nothing first
        errorMessage = ""
        
        // check if the bank, card, or fee fields of the form are empty and populate error message accordingly
        guard !bank.trimmingCharacters(in: .whitespaces).isEmpty,
              !card.trimmingCharacters(in: .whitespaces).isEmpty,
              !fee.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage="Please fill in all fields."
            return
        }
        
        // check if the fee is a number
        guard let numFee = Int(fee)
        else {
            errorMessage="Fee must be a positive number"
            return
        }
        
        // check if the fee is positive or 0
        guard numFee >= 0 else {
            errorMessage="Fee cannot be negative"
            return
        }
        
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        let newId = UUID().uuidString
        
        // set cardName variable to the concatenation of the bank and card variables with a space
        let cardName = bank + " " + card
        
        // assign card information variables accordingly
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
            fee: numFee
        )
        
        
        // save new credit card to the database under the user's document
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("cards")
            .document(newId)
            .setData(newItem.asDictionary())
        
        
    }
}
