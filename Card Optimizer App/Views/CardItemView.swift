//
//  CardItemView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import SwiftUI

// View for each card in the CardListView
struct CardItemView: View {
    
    // initiate item variable to the card passed in
    let item: cardItem
    var body: some View {
        // display the credit card name and date joined
        VStack(alignment: .leading) {
            Text(item.card)
                
            Text("\(Date(timeIntervalSince1970: item.joinDate).formatted(date: .abbreviated, time: .omitted))")
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
        }
    }
}

#Preview {
    CardItemView(item: .init(id: "123", card: "Amex Black", bank: "American Express", joinDate: Date() .timeIntervalSince1970, food: 0.01, groceries: 0.01, travel: 0.01, gas: 0.01, everything: 0.01, fee: 5000))
}
