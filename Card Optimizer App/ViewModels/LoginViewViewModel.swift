//
//  LoginViewViewModel.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//
import FirebaseAuth
import Foundation

// ViewModel for the LoginView
@Observable class LoginViewViewModel {
    
    // initialize variables for user email, pasword, and an error message
    var email = ""
    var password = ""
    var errorMessage = ""
    
    init() {}
    
    // function for allowing the user to login that populates the errorMessage variable if the login attempt fails and returns nothing
    
    func login() {
        
        // attempts to log the user in, if the login fails then the error message "invalid login" is printed
        
        Auth.auth().signIn(withEmail: email, password: password)
        if Auth.auth().currentUser == nil {
            errorMessage="Invalid Login"
        }
        
    }
    
    // this function guards against an empty or invalid email address and password and returns true if all tests pass
    private func validate() -> Bool {
        // set errorMessage to a blank string and determine if there is an error
        errorMessage = ""
        
        // if the email or password is empty, ask the user to fill in all fields
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage="Please fill in all fields."
            return false
        }
        
        // check if the email contains an "@" and a "." to determine if the email is valid
        guard email.contains("@") && email.contains(".") else {
            errorMessage="Please enter a valid email address"
            return false
        }
        
        // return true if all error checks have passed
        return true
    }
}

