//
//  PostGridView.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/13.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    let screenWidth = UIScreen.main.bounds.width - 5
    @StateObject var viewModel: PostGridViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            let posts = viewModel.posts
            ForEach(posts) { post in
//                NavigationLink(value: posts) {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: screenWidth/3, height: screenWidth/3)
                        .clipShape(RoundedRectangle(cornerRadius: 0))
                }
//                .navigationDestination(for: [Post].self) { post in
//                    PostsScrollView(posts: posts)
//                        .navigationBarBackButtonHidden()
//                }
//            }
        }
    }
}
