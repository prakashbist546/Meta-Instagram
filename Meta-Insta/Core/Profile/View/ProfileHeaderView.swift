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
                CircularProfileImageView(user: user, size: .large)
        
                Spacer()
                HStack(spacing: 8) {
                    UserStatView(value: 2, title: "Posts")
                    
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
                Text("follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(6)

            }
            
            Divider()
        }
    }
}

//struct ProfileHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeaderView(user: User.mock_users[1])
//    }
//}
