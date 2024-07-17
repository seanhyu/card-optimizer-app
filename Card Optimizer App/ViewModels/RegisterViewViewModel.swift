//
//  RegisterViewViewModel.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewViewModel: ObservableObject {
    // instantiate variables for name, email, password for the user as well as an error message, and set their values all to an empty string
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    // this function allows users to register
    
    func register() {
        
        // first check if the information is valid, if not then return
        
        guard validate() else {
            return
        }
        
        // create user using FirebaseAuth and add to the firebase using the insertUserRecord function
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result,error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    // this function adds the new user to the firestore database
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    // this function checks if all fields are filled correctly, and returns a non-empty error message if not filled correctly
    
    private func validate() -> Bool {
        
        // initialize the error message to an empty string
        
        errorMessage = ""
        
        // check if the fields are filled, if not then fill the adjust the error message
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage="Please fill in all fields."
            return false
        }
        
        // check if the email is valid, otherwise change the error message
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage="Please enter a valid email address."
            return false
        }
        
        // check if the password has at least 8 characters, otherwise adjust the error message
        
        guard password.count >= 8 else {
            errorMessage="Password must contain at least 8 characters."
            return false
        }
        
        // return true if all tests passed
        return true
        
    }
    
}
