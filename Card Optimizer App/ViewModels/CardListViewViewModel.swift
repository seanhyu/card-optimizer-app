//
//  CardListViewViewModel.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth


// ViewModel for the CardListView

@Observable class CardListViewViewModel {
    
    // initiate variable that determines whether this view should be shown to false
    var showingNewCardView = false
    var cards: [Card] = []
    var userId: String
    
    init() {
        self.userId = Auth.auth().currentUser?.uid ?? ""
    }
    // this function fetches the latest user credit card list 
    func fetchCards() async {
        let userId = self.userId
        let db = Firestore.firestore()
        self.cards = []
        do {
            let querySnapshot = try await db.collection("users").document(userId).collection("cards").getDocuments()
            for document in querySnapshot.documents {
                let data = document.data()
                let credit_card = Card(id: data["id"] as? String ?? "",
                                card: data["card"] as? String ?? "",
                                bank: data["bank"] as? String ?? "",
                                joinDate: data["joinDate"] as? TimeInterval ?? 0,
                                food: data["food"] as? Double ?? 0,
                                groceries: data["groceries"] as? Double ?? 0,
                                travel: data["travel"] as? Double ?? 0,
                                gas: data["gas"] as? Double ?? 0,
                                everything: data["everything"] as? Double ?? 0,
                                fee: data["fee"] as? Int ?? 0)
                self.cards.append(credit_card)
            }
        } catch {
            print("Error getting documents: \(error)")
        }
    }
    
    // this function deletes a card from the user's database and returns nothing
    func delete(id: String) {
        let db = Firestore.firestore()
        let userId = self.userId
        db.collection("users")
            .document(userId)
            .collection("cards")
            .document(id)
            .delete()
        
    }
    
    // this function iterates through the user's cards to and returns the credit card with the highest food earnings
    func bestFood() -> String {
        let items = self.cards
        var foodCashBack = 0.0
        var foodCard = "-"
        for card in items {
            if card.food > foodCashBack {
                foodCard = card.card
                foodCashBack = card.food
            }
        }
        return foodCard
    }
    
    // this function iterates through the user's cards and returns the credit card with the highest default earnings
    func bestDefault() -> String {
        let items = self.cards
        var defaultCashBack = 0.0
        var defaultCard = "-"
        for card in items {
            if card.everything > defaultCashBack {
                defaultCard = card.card
                defaultCashBack = card.everything
            }
        }
        return defaultCard
    }
    
    // this function iterates through the user's cards and returns the credit card with the highest grocery earnings
    func bestGroceries() -> String {
        let items = self.cards
        var groceriesCashBack = 0.0
        var groceriesCard = "-"
        for card in items {
            if card.groceries > groceriesCashBack {
                groceriesCard = card.card
                groceriesCashBack = card.groceries
            }
        }
        return groceriesCard
    }
    
    // this function iterates through the user's cards and returns the credit card with the highest gas earnings
    func bestGas() -> String {
        let items = self.cards
        var gasCashBack = 0.0
        var gasCard = "-"
        for card in items {
            if card.gas > gasCashBack {
                gasCard = card.card
                gasCashBack = card.gas
            }
        }
        return gasCard
    }
    
    // this function iterates through the user's cards and returns the credit cards with fees sorted in decreasing order
    func feeCards() -> [Card] {
        let items = self.cards
        var cardList: [Card] = []
        for item in items {
            if item.fee > 0 {
                cardList.append(item)
            }
        }
        cardList.sort(by: {$0.fee > $1.fee})
        return cardList
        
    }
    
    // this function returns all credit cards of the user
    func allCards() -> [Card] {
        return self.cards
    }
}
