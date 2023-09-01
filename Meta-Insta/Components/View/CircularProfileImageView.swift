//
//  CircularProfileImageView.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/20.
//

import SwiftUI
import Kingfisher

enum profileImageSize: CGFloat {
    case xSmall
    case small
    case medium
    case large
    
    var dimention: CGFloat {
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 64
        case .large:
            return 80
        }
    }
}

struct CircularProfileImageView: View {
    let user: User
    var size: profileImageSize
    
    var body: some View {
        
        if let imageUrl = user.profileImageURL {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimention, height: size.dimention)
                .clipShape(Circle())
            
        } else {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFill()
                .foregroundColor(Color.gray)
                .frame(width: size.dimention, height: size.dimention)
                .clipShape(Circle())
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.mock_users[0], size: .large)
    }
}
