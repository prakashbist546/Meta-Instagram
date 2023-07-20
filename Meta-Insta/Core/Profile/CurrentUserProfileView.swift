//
//  CurrentUserProfile.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/12.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    var posts: [Post] {
        return Post.mock_posts.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                //header
                VStack(spacing: 10) {
                    HStack {
                        //profile pic and stats
                        Image("xaya2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Spacer()
                        HStack(spacing: 8) {
                            UserStatView(value: 5, title: "Posts")
                            
                            UserStatView(value: 300, title: "Followers")
                            
                            UserStatView(value: 22, title: "Following")
                            
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    VStack (alignment: .leading, spacing: 4){
                        //name and bio
                        Text("Xaya Pandey")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("Love TS forever")
                            .font(.footnote)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    //edit profile button
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 160, height: 32)
                                .foregroundColor(.black)
                                .overlay(RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1))
                    }
                        Button {
                            
                        } label: {
                            Text("Share Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 160, height: 32)
                                .foregroundColor(.black)
                                .overlay(RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1))
                    }
                        Button {
                            
                        } label: {
                            Image(systemName:"person.badge.plus")
                                .resizable()
                                .scaledToFit()
                                .padding(6)
                                .fontWeight(.semibold)
                                .frame(width: 32, height: 32)
                                .foregroundColor(.black)
                                .overlay(RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1))
                    }
                    }
                    
                    Divider()
                }
                ScrollView(.horizontal) {
                    HStack (spacing: 10) {
                        ForEach(0...5, id: \.self) { index in
                            VStack {
                                Circle()
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.gray)
                                    .frame(width: 80)
                                    .overlay {
                                        Image(User.mock_users[0].profileImageURL ?? "")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 70, height: 70)
                                            .clipShape(Circle())
                                }
                                Text("love\(index)")
                                    .font(.callout)
                            }
                        }
                    }
                    .padding(.leading, 15)
                }
                .padding(.vertical, 10)
                .scrollIndicators(.hidden)
                //post grid view
                VStack(spacing: 1) {
                    PostGridView(posts: posts)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    HStack {
                        Image(systemName: "plus.square")
                        Button {
                            AuthService.shared.signOut()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.black)
                        }
                    }
                }
                ToolbarItem (placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "lock")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 8, height: 8)
                            .fontWeight(.semibold)
                        Text(user.username)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        Image(systemName: "chevron.down")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 6, height: 6)
                    }
                }
            }
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.mock_users[1])
    }
}
