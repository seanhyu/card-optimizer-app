//
//  Card_Optimizer_AppApp.swift
//  Card Optimizer App
//
//  Created by Sean Yu on 5/22/24.
//

import SwiftUI
import FirebaseCore



@main
struct Card_Optimizer_AppApp: App {
    init() {
        FirebaseApp.configure()
      }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}


