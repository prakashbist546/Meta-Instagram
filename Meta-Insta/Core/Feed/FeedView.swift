//
//  FeedView.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/11.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView (showsIndicators: false) {
                LazyVStack(spacing: 35) {
                    ForEach(Post.mock_posts) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 10)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image("Instagram_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 32)
                        Image(systemName: "chevron.down")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 6, height: 6)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
