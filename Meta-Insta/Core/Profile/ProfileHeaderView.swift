//
//  ProfileHeaderView.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/13.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                //profile pic and stats
                Image(user.profileImageURL ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Spacer()
                HStack(spacing: 8) {
                    UserStatView(value: 22, title: "Posts")
                    
                    UserStatView(value: 222, title: "Followers")
                    
                    UserStatView(value: 21, title: "Following")
                    
                }
                
            }
            .padding(.horizontal)
            
            VStack (alignment: .leading, spacing: 4){
                //name and bio
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            //edit profile button
            Button {
                
            } label: {
                Text("Share Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray, lineWidth: 1))
            }
            
            Divider()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.mock_users[1])
    }
}
