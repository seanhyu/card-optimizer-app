//
//  NewCardView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import SwiftUI


// view for adding a new card from pre-existing options
struct NewCardView: View {
    
    // variable for accessing view model information
    @State var viewModel = NewCardViewViewModel()
    
    // variable for determining if this view should be shown
    @Binding var newCardPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    
                    // title at top
                    Text("Add a card")
                        .padding(.top, 50)
                        .font(.system(size: 32))
                        .bold()
                    
                    // form for adding a new card
                    Form {
                        
                        // picker for choosing which bank the credit card is issued by, with the info fed to the viewModel
                        
                        Picker("Issuing Bank", selection: $viewModel.bank) {
                            ForEach(["American Express","Capital One","Chase","Citi","Discover","Wells Fargo"]) {item in
                                Text(item).tag(item)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        // get the available card options from the viewModel.options() function
                        let options = viewModel.options()
                        
                        // picker to choose which credit card
                        Picker("Credit Card", selection: $viewModel.card) {
                            ForEach(options) {
                                Text($0).tag($0)
                                
                            }
                        }
                        .pickerStyle(.menu)
                        
                        // picker to let user choose the date they acquired the card, with the latest date being today
                        DatePicker(selection: $viewModel.joinDate, in: ...Date.now, displayedComponents: .date, label: {Text("Date opened")})
                        
                        // Save button
                        COButtonView(title: "Save", background: .blue) {
                            viewModel.save()
                            newCardPresented = false
                        }
                    }
                    
                    // option for allowing users to add cards manually
                    
                    VStack {
                        Text("Don't see your card here?")
                        
                        // Navigates to CustomCardView if button is clicked; passed newCardPresented as a parameter
                        NavigationLink("Add It Manually", destination: CustomCardView( newCardPresented: $newCardPresented))
                    }
                    .padding(.bottom, 50)
                    Spacer()
                }
            }
            
        }
    }
}

// allows bank options to be identifiable for the purpose of the forEach loop
extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}

#Preview {
    NewCardView(newCardPresented: Binding(get: {
        return true
    }, set: {_ in }))
}
