//
//  ContentViewModel.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/18.
//

import Foundation
import Firebase
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    private let service  = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [ weak self ] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink { [ weak self ] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
}
