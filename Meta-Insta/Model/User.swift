//
//  User.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/11.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageURL: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var mock_users: [User] = [
        .init(id: NSUUID().uuidString, username: "erraz.me", profileImageURL: nil, fullname: "Prakash Bist", bio: "Love TS forever", email: "prakash@gmail.com"),
        .init(id: NSUUID().uuidString, username: "xaya546", profileImageURL: nil, fullname: "Xaya Pandey", bio: "Shiva is eternal", email: "xaya@gmail.com"),
        .init(id: NSUUID().uuidString, username: "suraz.hatake", profileImageURL: nil, fullname: "Suraz Bhandari", bio: "Lonely AF forever", email: "xuraz@gmail.com"),
        .init(id: NSUUID().uuidString, username: "taylor.swift", profileImageURL: nil, fullname: "Taylor Swift", bio: "Be strong everyday", email: "ts@gmail.com")

    ]
}
