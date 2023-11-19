//
//  ImageUploader.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 15/11/23.
//

import UIKit
import FirebaseStorage

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping (String) -> Void) {
        guard let imageDate = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageDate, metadata: nil) { _, error in
            if let error {
                print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully uploaded image to firestore storage...")
            
            ref.downloadURL { url, error in
                
                if let error {
                    print("DEBUG: Unable to get downloadURL with error is \(error.localizedDescription)")
                }
                
                guard let imageUrl = url?.absoluteString
                else
                {
                    print("DEBUG: Guard let error:url.absoluteString isn't available")
                    return
                }
                
                completion(imageUrl)
            }
        }
        
    }
}
