//
//  AuthViewModel.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 11/11/23.
//

import Firebase

class AuthViewModel: NSObject, ObservableObject {
    
    func login() {
        print("DEBUG: login called...")
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        print("DEBUG: register called...")
        print("DEBUG: email => \(email)")
        print("DEBUG: password => \(password)")
        print("DEBUG: fullname => \(fullname)")
        print("DEBUG: username => \(username)")
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error {
                print("DEBUG: Failed to register user with error => \(error)")
                return
            }
            
            print("DEBUG: Successfully registered user with firebase...")
        }
    }
    
    func uploadProfileImage() {
        print("DEBUG: uploadProfileImage called...")
    }
    
    func signout() {
        print("DEBUG: signout called...")
    }
}
