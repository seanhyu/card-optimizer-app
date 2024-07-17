//
//  MainViewViewModel.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    // instantiate and initiate variable for currentUserId to an empty string and attempt 
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
 
