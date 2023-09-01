//
//  UserService.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/20.
//

import Foundation
import Firebase

struct UserService {
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        return snapshot.documents.compactMap( { try? $0.data(as: User.self)} )
    }
    
    static func fetchUserDetails(withId id: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(id).getDocument()
        return try snapshot.data(as: User.self)
    }
}
