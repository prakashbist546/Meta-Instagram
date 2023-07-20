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
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundColor(Color.gray)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
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
                            ForEach(User.mock_user_details) { userDetail in
                                    ProfileView(user: user, userInfo: userDetail)
                            }
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
