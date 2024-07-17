//
//  LoginView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Card Optimizer", subtitle: "Maximize your points", background: .blue)
                
                
                
                // Login form with buttons
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $viewModel.email )
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password )
                        .textFieldStyle(DefaultTextFieldStyle())
                    COButtonView(title: "Login", background: .blue) {viewModel.login()}
                    
                }
                // Create account
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
