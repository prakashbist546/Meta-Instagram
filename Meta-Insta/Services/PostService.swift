//
//  PostService.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/21.
//

import Foundation
import Firebase

struct PostService {
    
    private static let postCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })

        for i in 0..<posts.count {
            let post = posts[i]
            let ownerId = post.ownerUID
            let postUser = try await UserService.fetchUserDetails(withId: ownerId)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postCollection.whereField("ownerUID", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
    }
}
