//
//  COButtonView.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/23/24.
//

import SwiftUI

// View for the large blue buttons used for saving and logging in

struct COButtonView: View {
    
    // takes in parameters for title, background color, and the action after the button is clicked
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    COButtonView( title: "Button", background: .blue){}
}
