//
//  ProfileViewViewModel.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// ViewModel for the ProfileView
class ProfileViewViewModel: ObservableObject {
    init() {
        
    }
    
    // variable ot store the user, initially set to Nil
    @Published var user: User? = nil
    
    // function for fetching the current userId if a user is logged in that populates the user variable if successful and returns nothing
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
    }
    
    // function to allow user to log out and prints an error otherwise
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
}
