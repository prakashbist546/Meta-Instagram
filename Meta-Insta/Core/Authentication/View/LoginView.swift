//
//  LoginView.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/11.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            Spacer()
            //logo
            VStack {
                Image("Instagram_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
            }
            //text fields
            VStack {
                TextField("Enter your username or email", text: $viewModel.email)
                    .modifier(CustomTextField())
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(CustomTextField())
                if viewModel.errorLogin {
                    Text("Error login credentials")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            }
            
            Button {
                print("forgot pass clicked")
            } label: {
                Text("Forgot Password ?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .padding(.trailing, 28)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Button {
                Task {
                    try await viewModel.signIn()
                }
            } label: {
                Text("Log In")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.trailing, 28)
                    .frame(width: 360, height: 44)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            HStack {
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: (UIScreen.main.bounds.width/2)-40, height: 1)
                
                Text("OR")
                    .fontWeight(.semibold)
                    .font(.footnote)
                
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: (UIScreen.main.bounds.width/2)-40, height: 1)
                    .foregroundColor(Color.gray)
                
            }
            .foregroundColor(Color.gray)
            
            HStack {
                Image(systemName: "globe")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                Text("Continue with Facebook")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.blue)
            .padding(.vertical)

            Spacer()
            
            Divider()
            
            NavigationLink {
                AddEmailView()
                    .navigationBarBackButtonHidden()
            } label: {
                HStack(spacing: 3) {
                    Text("Don't have an account?")
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
