//
//  CardListViewViewModel.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import Foundation
import FirebaseFirestore

class CardListViewViewModel: ObservableObject {
    @Published var showingNewCardView = false
    private let userId: String
    
    
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("cards")
            .document(id)
            .delete()
        
    }
    
    
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
