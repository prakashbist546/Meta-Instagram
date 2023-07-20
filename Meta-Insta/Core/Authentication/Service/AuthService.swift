//
//  AuthService.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/18.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User
    @Published var currentUser: User?
    @Published var errorLogin: Bool?
    
    static let shared = AuthService()
    
    init() {
        
        Task { try await loadUserData() }
    }
    
    @MainActor
    func login(withEmail email: String, and password: String ) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("DEBUG: Failed to login user \(error.localizedDescription)")
            errorLogin = true
        }

    }
    
    @MainActor
    func createUser(email: String, password: String, username: String ) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: user created")
            await self.uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("DEBUG: Failed to register user \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        self.currentUser = try? snapshot.data(as: User.self)
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        self.currentUser = user
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        print("DEBUG: user data uploaded")
    }
}
