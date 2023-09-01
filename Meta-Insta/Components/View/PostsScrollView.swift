//
//  PostsScrollView.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/21.
//

import SwiftUI

struct PostsScrollView: View {
    @Environment(\.dismiss) var dismiss
    let posts: [Post]
    
    var body: some View {
        VStack {
            ScrollView (showsIndicators: false) {
                LazyVStack(spacing: 35) {
                    ForEach(posts) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 10)
            }
        }
        .toolbar {
            ToolbarItem (placement: .principal) {
                VStack {
                    if let user = posts[0].user {
                        Text(user.username)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                Text("Posts")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                     }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct PostsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        PostsScrollView(posts: Post.mock_posts)
    }
}
