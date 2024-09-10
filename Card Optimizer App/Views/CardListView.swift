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
    
    // initiate variable for the corresponding ViewModel
    @State var viewModel = CardListViewViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                // list with sections that each pull the best cards from each category from the corresponding functions and displays them
                List {
                    Section(header: Text("Best Card for Food")) {
                        Text(viewModel.bestFood())
                    }
                    Section(header: Text("Best Card for Groceries")) {
                        Text(viewModel.bestGroceries())
                    }
                    Section(
                        header: Text("Best Card for Gas"),
                        footer: Text("If the Citi Custom Cash Card is listed here, it assumes you only use this card for gas")) {
                            Text(viewModel.bestGas())
                        }
                    Section(header: Text("Best Default Card")) {
                        Text(viewModel.bestDefault())
                    }
                    // displays all credit cards with annual fees
                    Section(header: Text("Cards with Annual Fees")) {
                        ForEach(viewModel.feeCards()) {item in
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
                        ForEach(viewModel.allCards()) {item in
                            VStack(alignment: .leading) {
                                Text(item.card)
                                Text("\(Date(timeIntervalSince1970: item.joinDate).formatted(date: .abbreviated, time: .omitted))")
                                    .font(.footnote)
                                    .foregroundColor(Color(.secondaryLabel))
                            }
                            // adds swipeActions to allow user to delete credit cards
                            .swipeActions {
                                Button {
                                    viewModel.delete(id: item.id)
                                    // refreshes the card list upon deleting the card
                                    Task {
                                        await viewModel.fetchCards()
                                    }
                                } label: {
                                    Text("Delete")
                                }
                                .tint(.red)
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
                        .onDisappear {
                            // refreshes the card list upon adding the card
                            Task {
                                await viewModel.fetchCards()
                            }
                        }
                }
            }
            // loads the user card list before displaying
            .onAppear {
                
                Task {
                    await viewModel.fetchCards()
                }
                
            }
        }
    }
}

/*
#Preview {
    CardListView()
}
*/

//$cardList.path = "users/\(viewModel.userId)/cards"
//@FirestoreQuery(collectionPath: "users") var cardList: [Card]
