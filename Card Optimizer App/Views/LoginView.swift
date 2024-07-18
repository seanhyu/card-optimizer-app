//
//  LoginView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import SwiftUI

struct LoginView: View {
    
    // variable for the relevant ViewModel
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                // header
                HeaderView(title: "Card Optimizer", subtitle: "Maximize your points", background: .blue)
                                
                // login form
                Form {
                    // displays error message if one exists
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    // text fields for email address and password
                    TextField("Email Address", text: $viewModel.email )
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password )
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    //login button
                    COButtonView(title: "Login", background: .blue) {viewModel.login()}
                    
                }
                // create account button
                VStack {
                    Text("First time here?")
                    NavigationLink("Sign Up", destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
