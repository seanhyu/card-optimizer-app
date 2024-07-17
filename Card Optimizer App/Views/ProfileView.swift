//
//  ProfileView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user{
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(width:125, height:125)
                        .padding()
                    
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
                        
                        Text("")
                    }
                    Button("Log Out") {
                        viewModel.logOut()
                    }
                    .tint(.red)
                    Spacer()
                } else {
                    Text("Loading User...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
