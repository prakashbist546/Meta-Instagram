//
//  Post.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/13.
//

import Foundation

struct Post: Hashable, Codable, Identifiable {
    let id: String
    let caption: String
    let ownerUID: String
    var likes: Int
    let imageUrl: String
    let timeStamp: Date
    var user: User?
}


extension Post {
    static var mock_posts: [Post] = [
        .init(id: NSUUID().uuidString,
              caption: "i am invincible",
              ownerUID: NSUUID().uuidString,
              likes: 223,
              imageUrl: "love2",
              timeStamp: Date(),
              user: User.mock_users[0]),
        .init(id: NSUUID().uuidString,
              caption: "love myself",
              ownerUID: NSUUID().uuidString,
              likes: 143,
              imageUrl: "xaya1",
              timeStamp: Date(),
              user: User.mock_users[1]),
        .init(id: NSUUID().uuidString,
              caption: "love myself",
              ownerUID: NSUUID().uuidString,
              likes: 403,
              imageUrl: "xaya2",
              timeStamp: Date(),
              user: User.mock_users[1]),
        .init(id: NSUUID().uuidString,
              caption: "my favourite human",
              ownerUID: NSUUID().uuidString,
              likes: 431,
              imageUrl: "love2",
              timeStamp: Date(),
              user: User.mock_users[1]),
        .init(id: NSUUID().uuidString,
              caption: "i am gonna rock",
              ownerUID: NSUUID().uuidString,
              likes: 23,
              imageUrl: "suraz1",
              timeStamp: Date(),
              user: User.mock_users[2]),
        .init(id: NSUUID().uuidString,
              caption: "hey there",
              ownerUID: NSUUID().uuidString,
              likes: 990,
              imageUrl: "love1",
              timeStamp: Date(),
              user: User.mock_users[3])
    ]
}
