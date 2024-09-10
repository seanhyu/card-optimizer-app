//
//  MainViewViewModel.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import FirebaseAuth
import Foundation

// ViewModel for MainView
@Observable class MainViewViewModel {
    
    // instantiate and initiate variable for currentUserId to an empty string
    var currentUserId: String = ""
    
    // instantiate handler to track change in login state
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        // attempt to assign currentUserId and resets the app using the new login status
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    // function that returns if the user is signed in
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
 
