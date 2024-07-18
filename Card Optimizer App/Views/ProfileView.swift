//
//  ProfileView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import SwiftUI

// view for user profile information
struct ProfileView: View {
    
    // initiate StateObject variable for the corresponding ViewModel
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                // if user information avaialble, display the information
                if let user = viewModel.user{
                    
                    // Displays profile image
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(width:125, height:125)
                        .padding()
                    
                    // display user information
                    VStack(alignment: .leading, spacing: 10) {
                        HStack{
                            Text("Name: ")
                                .bold()
                            Text(user.name)

                        }
                        HStack{
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        HStack {
                            Text("Joined: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated, time:.omitted))")
                        }
                        // Spacer
                        Text("")
                    }
                    
                    // button for logging out
                    Button("Log Out") {
                        viewModel.logOut()
                    }
                    .tint(.red)
                    Spacer()
                
                // display "Loading User" if the user information is unavailable
                } else {
                    Text("Loading User...")
                }
            }
            .navigationTitle("Profile")
        }
        
        // fetches user when the view is accessed
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
