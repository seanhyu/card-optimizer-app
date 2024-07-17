//
//  CustomCardView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 7/15/24.
//

import SwiftUI

struct CustomCardView: View {
    @StateObject var viewModel = CustomCardViewViewModel()
    @Binding var newCardPresented: Bool
    var body: some View {
        VStack {
            Text("Add a card")
                .padding(.top, 50)
                .font(.system(size: 32))
                .bold()
            
            Form {
                TextField("Issuing Bank", text: $viewModel.bank)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Card Name", text: $viewModel.card)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker(selection: $viewModel.joinDate, in: ...Date.now, displayedComponents: .date, label: {Text("Date opened")})
                
                Picker("Food Earnings Rate", selection: $viewModel.food) {
                    ForEach([0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1], id: \.self) { number in
                            Text(String(format: "%.f%%", number*100))
                        }
                }
                .pickerStyle(.menu)
                
                Picker("Groceries Earnings Rate", selection: $viewModel.groceries) {
                    ForEach([0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1], id: \.self) { number in
                            Text(String(format: "%.f%%", number*100))
                        }
                }
                .pickerStyle(.menu)
                
                Picker("Travel Earnings Rate", selection: $viewModel.travel) {
                    ForEach([0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1], id: \.self) { number in
                            Text(String(format: "%.f%%", number*100))
                        }
                }
                .pickerStyle(.menu)
                
                Picker("Gas Earnings Rate", selection: $viewModel.gas) {
                    ForEach([0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1], id: \.self) { number in
                            Text(String(format: "%.f%%", number*100))
                        }
                }
                .pickerStyle(.menu)
                
                Picker("Default Earnings Rate", selection: $viewModel.everything) {
                    ForEach([0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1], id: \.self) { number in
                            Text(String(format: "%.f%%", number*100))
                        }
                }
                .pickerStyle(.menu)
                
                TextField("Annual fee", text: $viewModel.fee)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .keyboardType(.decimalPad)
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
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
