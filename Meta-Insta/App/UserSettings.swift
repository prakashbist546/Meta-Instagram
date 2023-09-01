//
//  UserSettings.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/21.
//

import Foundation

enum UserSettings: String {
    
    case isLoggedOut
    
    static func initialize() {
        UserDefaults.standard.register(defaults: [
            UserSettings.isLoggedOut.rawValue: true
        ])
    }
    
    func set(value: Any) {
        switch self {
        case .isLoggedOut:
            if let value = value as? Bool {
                UserDefaults.standard.set(value, forKey: self.rawValue)
            }
        }
        UserDefaults.standard.synchronize()
    }
    
    func bool() -> Bool {
        return UserDefaults.standard.bool(forKey: self.rawValue)
    }
    
    func string() -> String {
        return UserDefaults.standard.string(forKey: self.rawValue) ?? ""
    }
    
    func removeValue() {
        UserDefaults.standard.removeObject(forKey: self.rawValue)
    }
}
