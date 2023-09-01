//
//  LoginViewModel.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/18.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email  = ""
    @Published var password = ""
    
    func signIn() async throws {
        try? await AuthService.shared.login(withEmail: email, and: password)
    }
    
    var errorLogin: Bool {
        return AuthService.shared.errorLogin ?? false
    }
}
