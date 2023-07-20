//
//  PostGridView.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/13.
//

import SwiftUI

struct PostGridView: View {
    let screenWidth = UIScreen.main.bounds.width - 5
    var posts: [Post]
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(posts, id: \.self) { post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: screenWidth/3, height: screenWidth/3)
                    .clipShape(RoundedRectangle(cornerRadius: 0))
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(posts: Post.mock_posts)
    }
}
