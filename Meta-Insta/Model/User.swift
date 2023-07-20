//
//  User.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/11.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageURL: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var mock_users: [User] = [
        .init(id: NSUUID().uuidString, username: "erraz.me", profileImageURL: "erraz1", fullname: "Prakash Bist", bio: "Love TS forever", email: "prakash@gmail.com"),
        .init(id: NSUUID().uuidString, username: "xaya546", profileImageURL: "xaya1", fullname: "Xaya Pandey", bio: "Shiva is eternal", email: "xaya@gmail.com"),
        .init(id: NSUUID().uuidString, username: "suraz.hatake", profileImageURL: "suraz1", fullname: "Suraz Bhandari", bio: "Lonely AF forever", email: "xuraz@gmail.com"),
        .init(id: NSUUID().uuidString, username: "taylor.swift", profileImageURL: "love1", fullname: "Taylor Swift", bio: "Be strong everyday", email: "ts@gmail.com")

    ]
}
