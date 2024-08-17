//
//  CardListView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//
import FirebaseFirestoreSwift
import SwiftUI

// View for the list of cards
struct CardListView: View {
    // initiate StateObject variable for the corresponding ViewModel
    @StateObject var viewModel: CardListViewViewModel
    
    // instantiate variable to store all user credit cards
    @FirestoreQuery var items: [Card]
    
    
    init(userId: String) {
        // initiate items to all user credit cards, pulled from the firestore database
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/cards"
        )
        // initiate viewModel to the corresponding ViewModel for the user
        self._viewModel = StateObject(
            wrappedValue: CardListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // list with sections that each pull the best cards from each category from the corresponding functions and displays them
                List {
                    
                    Section(header: Text("Best Card for Food")) {
                        Text(viewModel.bestFood(items:items))
                        }
                    
                    Section(header: Text("Best Card for Groceries")) {
                        Text(viewModel.bestGroceries(items:items))
                        }
                    
                    Section(
                        header: Text("Best Card for Gas"),
                        footer: Text("If the Citi Custom Cash Card is listed here, it assumes you only use this card for gas")) {
                        Text(viewModel.bestGas(items:items))
                        }
                    
                    Section(header: Text("Best Default Card")) {
                        Text(viewModel.bestDefault(items:items))
                        }
                    
                    // displays all credit cards with annual fees
                    Section(header: Text("Cards with Annual Fees")) {
                        ForEach(viewModel.feeCards(items:items)) {item in
                            VStack(alignment: .leading) {
                                Text(item.card)
                                    
                                Text("Fee: $\(item.fee)")
                                    .font(.footnote)
                                    .foregroundColor(Color(.secondaryLabel))
                            }
                            
                        }
                    }
                    
                    // lists all credit cards
                    Section(header: Text("All Cards")) {
                        ForEach(items) {item in
                            CardItemView(item: item)
                            
                            // adds swipeActions to allow user to delete credit cards
                                .swipeActions {
                                    Button {
                                        viewModel.delete(id: item.id)
                                    } label: {
                                        Text("Delete")
                                    }
                                    .tint(.red)
                                }
                        }
                    }
                }
                
            }
            // title of the page
            .navigationTitle("Cards")
            .toolbar {
                // button to allow user to add new cards
                Button {
                    // if button is clicked, set the variable for showingNewCardView to true
                    viewModel.showingNewCardView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            // display NewCardView view if showingNewCardView is true
            .sheet(isPresented: $viewModel.showingNewCardView) {
                NewCardView(newCardPresented: $viewModel.showingNewCardView)
            }
        }
    }
}

#Preview {
    CardListView(userId: "0h6tNL3ijsOcXgkipY2vtEIQi0V2")
}
