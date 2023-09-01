//
//  EditProfileView.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/20.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
        
    @StateObject var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    Task { try await viewModel.updateUserData()
                        dismiss()
                    }
                } label: {
                    Text("Done")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.postImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } else {
                        CircularProfileImageView(user: viewModel.user, size: .large)
                    }
                    
                    Text("Edit Profile Picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
                .padding(.vertical, 8)
                
            }
        
            EditProfileRowView(title: "Name", placeholder: viewModel.user.fullname ?? "Enter your name" , text: $viewModel.fullname)
            EditProfileRowView(title: "Bio", placeholder: viewModel.user.bio ?? "Enter your bio", text: $viewModel.bio)
            
            Spacer()
        }
    }
}

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
     
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading)
                .frame(width: 70, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text, axis: .vertical)

                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.mock_users[0])
    }
}
