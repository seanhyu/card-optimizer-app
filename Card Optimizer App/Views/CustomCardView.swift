//
//  CustomCardView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 7/15/24.
//

import SwiftUI

// View for allowing users to manually add a credit card
struct CustomCardView: View {
    
    // stateObject variable to access the relevant viewModel logic
    @StateObject var viewModel = CustomCardViewViewModel()
    
    // variable for determining if this view should be presented
    @Binding var newCardPresented: Bool
    
    var body: some View {
        VStack {
            // title
            Text("Add a card")
                .padding(.top, 50)
                .font(.system(size: 32))
                .bold()
            
            // form for adding a card
            Form {
                // text field for which bank
                TextField("Issuing Bank", text: $viewModel.bank)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // text field for which card
                TextField("Card Name", text: $viewModel.card)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // date picker to choose which day the card was opened
                DatePicker(selection: $viewModel.joinDate, in: ...Date.now, displayedComponents: .date, label: {Text("Date opened")})
                
                // picker for food earnings rate
                Picker("Food Earnings Rate", selection: $viewModel.food) {
                    ForEach([0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1], id: \.self) { number in
                            Text(String(format: "%.f%%", number*100))
                        }
                }
                .pickerStyle(.menu)
                
                // picker for grocery earnings rate
                Picker("Groceries Earnings Rate", selection: $viewModel.groceries) {
                    ForEach([0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1], id: \.self) { number in
                            Text(String(format: "%.f%%", number*100))
                        }
                }
                .pickerStyle(.menu)
                
                // picker for travel earnings rate
                Picker("Travel Earnings Rate", selection: $viewModel.travel) {
                    ForEach([0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1], id: \.self) { number in
                            Text(String(format: "%.f%%", number*100))
                        }
                }
                .pickerStyle(.menu)
                
                // picker for gas earnings rate
                Picker("Gas Earnings Rate", selection: $viewModel.gas) {
                    ForEach([0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1], id: \.self) { number in
                            Text(String(format: "%.f%%", number*100))
                        }
                }
                .pickerStyle(.menu)
                
                // picker for default earnings rate
                Picker("Default Earnings Rate", selection: $viewModel.everything) {
                    ForEach([0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1], id: \.self) { number in
                            Text(String(format: "%.f%%", number*100))
                        }
                }
                .pickerStyle(.menu)
                
                // text field for annual fee
                TextField("Annual fee", text: $viewModel.fee)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .keyboardType(.decimalPad)
                
                // presents an error Message if one exists
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                // save button which closes this view if there is no error message
                COButtonView(title: "Save", background: .blue) {
                    viewModel.save()
                    if viewModel.errorMessage == "" {
                        newCardPresented = false
                    }
                }
                
                
            }
        }
    }
    
}



#Preview {
    CustomCardView(newCardPresented: Binding(get: {
        return true
    }, set: {_ in }))
}
