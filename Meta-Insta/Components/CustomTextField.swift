//
//  CustomTextField.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/11.
//

import Foundation
import SwiftUI

struct CustomTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.subheadline)
        .padding(12)
        .background(Color(.systemGray6))
        .cornerRadius(6)
        .padding(.horizontal, 25)
        .textInputAutocapitalization(.never)
    }
}
