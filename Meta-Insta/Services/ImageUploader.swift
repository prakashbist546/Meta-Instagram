//
//  ImageUploader.swift
//  Meta-Insta
//
//  Created by Prakash Bist on 2023/07/20.
//

import Foundation
import UIKit
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: upload image failed with error: \(error.localizedDescription)")
            return nil
        }
    }
}
