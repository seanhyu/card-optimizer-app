//
//  HeaderView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import SwiftUI

// View for the header on the login page
struct HeaderView: View {
    let title: String
    let subtitle: String
    let background: Color
    
    var body: some View {
        ZStack {
            // Blue Rectangle at top
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
            // Text
            VStack {
                Text(title)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .bold()
                Text(subtitle)
                    .foregroundColor(.white)
                    .font(.system(size: 20))


            }
            .padding(.top,30)
            
        }
        .frame(width:UIScreen.main.bounds.width * 3, height: 250)
        .offset(y:-60)
    }
}

#Preview {
    HeaderView(title: "Card Optimizer", subtitle: "Maximize your points", background: .blue)
}
