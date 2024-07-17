//
//  CustomCardViewViewModel.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 7/15/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class CustomCardViewViewModel: ObservableObject {
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
    
    func save()  {
        errorMessage = ""
        guard !bank.trimmingCharacters(in: .whitespaces).isEmpty,
              !card.trimmingCharacters(in: .whitespaces).isEmpty,
              !fee.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage="Please fill in all fields."
            return
        }
        
        guard let numFee = Int(fee)
        else {
            errorMessage="Not a valid fee."
            return
        }
        
        guard numFee >= 0 else {
            errorMessage="Fee cannot be negative"
            return
        }
        
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        
        let cardName = bank + " " + card
        
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
            fee: numFee
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
