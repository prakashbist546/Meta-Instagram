//
//  SearchView.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/11.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                CircularProfileImageView(user: user, size: .xSmall)
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    
                                    Text(user.fullname ?? "")
                                }
                                .font(.footnote)
                                Spacer()
                                Button {
                                    viewModel.users.removeAll { item in
                                        user.id == item.id
                                    }
                                } label: {
                                    Image(systemName: "multiply")
                                        .foregroundColor(Color(UIColor.lightGray))
                                }
                            }
                            .padding(.horizontal)
                        }
                        .navigationDestination(for: User.self) { user in
                            ProfileView(user: user)
                                .navigationBarBackButtonHidden()
                        }
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
