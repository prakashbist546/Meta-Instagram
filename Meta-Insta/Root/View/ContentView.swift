//
//  ContentView.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/11.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModal = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        Group {
            if UserSettings.isLoggedOut.bool(){
                LoginView()
                    .environmentObject(registrationViewModel)
            } else if let currentUser = viewModal.currentUser {
                MainTabView(user: currentUser)
            }
        }
    }
}
