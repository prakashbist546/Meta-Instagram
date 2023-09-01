//
//  FeedCell.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/11.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            //profile image and name
            if let user = post.user {
                HStack {
                    CircularProfileImageView(user: user, size: .xSmall)
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
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400)
                    .clipShape(Rectangle())
                
                //action buttons
            }
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
            
            Text("\(formatLikes(num: post.likes)) Likes")
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
    
    func formatLikes(num: Int) -> String {
        if num < 999999 && num > 999 {
            return "\(Float(num/100)/10)K"
        }
        
        if num > 999999 {
            return "\(Float(num/100000)/10)M"
        }
        return "\(num)"
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.mock_posts[0])
    }
}
