//
//  ContentView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/22/24.
//

import SwiftUI

struct MainView: View {
    
    // main view 
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TabView {
                CardListView(userId: viewModel.currentUserId)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        } else {
            LoginView()
        }
        
    }
}

#Preview {
    MainView()
}
