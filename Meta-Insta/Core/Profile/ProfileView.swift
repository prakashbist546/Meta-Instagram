//
//  ProfileView.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/11.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    var posts: [Post] {
        return Post.mock_posts.filter({$0.user?.username == user.username})
    }
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    var body: some View {
            ScrollView {
                //header
                ProfileHeaderView(user: user)
                //post grid view
                VStack(spacing: 2) {
                    PostGridView(posts: posts)
                }
            }
            .navigationTitle(user.username)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.black)
                }
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.mock_users[0])
    }
}
