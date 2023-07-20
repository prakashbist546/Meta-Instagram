//
//  CompleteSignupView.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/11.
//

import SwiftUI

struct CompleteSignupView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel

    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("Welcome to Instagram, \(viewModel.username)")
                .multilineTextAlignment(.center)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Click here below to complete registration and start using Instagram.")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.trailing, 28)
                    .frame(width: 360, height: 44)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }

}

struct CompleteSignupView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignupView()
    }
}
