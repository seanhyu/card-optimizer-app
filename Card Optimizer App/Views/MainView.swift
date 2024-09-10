//
//  ContentView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/22/24.
//

import SwiftUI

struct MainView: View {
    // initiate variable for the corresponding ViewModel
    @State var viewModel = MainViewViewModel()
    var body: some View {
        
        // if the user is signed in, show the cardlist and profile tab view
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            
            TabView {
                
                CardListView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        } 
        // if the user is not logged in, show the LoginView
        else {
            LoginView()
        }
        
    }
}

#Preview {
    MainView()
}
