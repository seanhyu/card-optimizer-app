//
//  CardListViewViewModel.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import Foundation
import FirebaseFirestore

// ViewModel for the CardListView

class CardListViewViewModel: ObservableObject {
    
    // initiate variable that determines whether this view should be shown to false
    @Published var showingNewCardView = false
    
    // instantiate variable for userId
    private let userId: String
    
    
    
    init(userId: String) {
        
        // get the userId
        self.userId = userId
    }
    
    // this function deletes a card from the user's database and returns nothing
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("cards")
            .document(id)
            .delete()
        
    }
    
    // this function iterates through the user's cards to and returns the credit card with the highest food earnings
    func bestFood(items: [cardItem]) -> String {
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
    func bestDefault(items: [cardItem]) -> String {
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
    func bestGroceries(items: [cardItem]) -> String {
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
    func bestGas(items: [cardItem]) -> String {
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
    func feeCards(items: [cardItem]) -> [cardItem] {
        var cardList: [cardItem] = []
        for item in items {
            if item.fee > 0 {
                cardList.append(item)
            }
        }
        cardList.sort(by: {$0.fee > $1.fee})
        return cardList
        
    }
}
