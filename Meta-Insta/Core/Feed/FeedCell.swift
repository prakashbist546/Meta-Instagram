//
//  FeedCell.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/11.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            //profile image and name
            if let user = post.user {
            HStack {
                Image(user.profileImageURL ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Spacer()
                Text("...")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .padding(.trailing)
                }
            .padding(.leading, 8)
                //post
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400)
                    .clipShape(Rectangle())
                
                //action buttons
                
                HStack(spacing: 16) {
                    Button {
                        print("like clicked")
                    } label: {
                        Image(systemName: "heart")
                            .imageScale(.large)
                    }
                    
                    Button {
                        print("comment clicked")
                    } label: {
                        Image(systemName: "bubble.right")
                            .imageScale(.large)
                    }
                    
                    Button {
                        print("share clicked")
                    } label: {
                        Image(systemName: "paperplane")
                            .imageScale(.large)
                    }
                    Spacer()
                    Image(systemName: "bookmark")
                        .fontWeight(.semibold)
                        .padding(.trailing)
                }
                .padding(.leading, 8)
                .padding(.top, 4)
                .foregroundColor(.black)
                
                Text("\(post.likes) Likes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.top, 1)
                
                HStack {
                    Text(post.user?.username ?? "").fontWeight(.semibold) +
                    Text(" \(post.caption)")
                }
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                
                Text("2h ago")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.top, 1)
            }
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.mock_posts[0])
    }
}
