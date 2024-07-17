//
//  NewCardView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import SwiftUI



struct NewCardView: View {
    @StateObject var viewModel = NewCardViewViewModel()
    @Binding var newCardPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Add a card")
                        .padding(.top, 50)
                        .font(.system(size: 32))
                        .bold()
                    
                    Form {
                        Picker("Issuing Bank", selection: $viewModel.bank) {
                            ForEach(["American Express","Capital One","Chase","Citi","Discover","Wells Fargo"]) {item in
                                Text(item).tag(item)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        let options = viewModel.options()
                        Picker("Credit Card", selection: $viewModel.card) {
                            ForEach(options) {
                                Text($0).tag($0)
                                
                            }
                        }
                        
                        .pickerStyle(.menu
                        )
                        DatePicker(selection: $viewModel.joinDate, in: ...Date.now, displayedComponents: .date, label: {Text("Date opened")})
                        
                        COButtonView(title: "Save", background: .blue) {
                            viewModel.save()
                            newCardPresented = false
                        }
                        
                        
                    }
                    VStack {
                        Text("Don't see your card here?")
                        NavigationLink("Add It Manually", destination: CustomCardView( newCardPresented: $newCardPresented))
                    }
                    .padding(.bottom, 50)
                    Spacer()
                }
            }
            
        }
    }
}
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
