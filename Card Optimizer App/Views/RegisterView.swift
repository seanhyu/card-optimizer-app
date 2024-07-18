//
//  RegisterView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import SwiftUI

// View for user registration
struct RegisterView: View {
    
    // variable for the relevant ViewModel
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            
            // title
            HeaderView(title: "Sign Up", subtitle: "Maximize your points", background: .blue)
                .offset(y:-40)
            
            // registration form
            Form {
                // if error message exists, print the error message
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                // text fields for user name, email and password
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // register button
                COButtonView(title: "Sign Up", background: .blue) {viewModel.register()}
            }
            .offset(y:-50)
            Spacer()
        }
        
    }
}

#Preview {
    RegisterView()
}
