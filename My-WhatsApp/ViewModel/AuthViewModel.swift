//
//  AuthViewModel.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 11/11/23.
//

import Firebase

class AuthViewModel: NSObject, ObservableObject {
    
    // note: User and FirebaseAuth.User are two different things
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    override init() {
        super.init()
        
        print("DEBUG: AuthViewModel did init...")
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        print("DEBUG: login called...")
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error {
                print("DEBUG: Failed to sign-in with error \(error.localizedDescription)")
                return
            }
            
            self.userSession = result?.user
            print("DEBUG: Successfully logged in...")
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        print("DEBUG: register called...")
        print("DEBUG: email => \(email)")
        print("DEBUG: password => \(password)")
        print("DEBUG: fullname => \(fullname)")
        print("DEBUG: username => \(username)")
        
        Auth.auth().createUser(withEmail: email, password: password) { (result: AuthDataResult?, error: Error?) in
            if let error {
                print("DEBUG: Failed to register user with error => \(error)")
                return
            }
            
            guard let user: FirebaseAuth.User = result?.user
            else {
                print("DEBUG: Unable to get user from result...")
                return
            }
            
            self.tempCurrentUser = user
            
            let data: [String: Any] = ["email": email,
                                       "username": username,
                                       "fullname": fullname]
            
            COLLECTION_USERS.document(user.uid).setData(data) { error in
                if let error {
                    print("DEBUG: Unable to upload user details because error => \(error)")
                } else {
                    print("DEBUG: Successfully uploaded user details...")
                    self.didAuthenticateUser = true
                }
            }
            
            print("DEBUG: Successfully registered user with firebase...")
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        print("DEBUG: uploadProfileImage called...")
        
        guard let uid = tempCurrentUser?.uid 
        else
        {
            print("DEBUG: Guard let error unable to get uid!")
            return
        }
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            COLLECTION_USERS.document(uid).updateData(["profileImageUrl": imageUrl]) { error in
                if let error {
                    print("DEBUG: Unable to update data profileImageUrl with error \(error.localizedDescription)")
                    return
                }
                print("DEBUG: Successfully updated profileImageUrl...")
                self.userSession = self.tempCurrentUser
                self.fetchUser()
            }
        }
    }
    
    func signout() {
        print("DEBUG: signout called...")
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else {
            print("DEBUG: Guard let error unable to get uid from user-session!")
            return
        }
        
        COLLECTION_USERS.document(uid).getDocument { (snapshot: DocumentSnapshot?, error: Error?) in
            
            guard let _ = snapshot?.data() else {
                print("DEBUG: Guard let error unable to get data from snapshot")
                return
            }
            
            guard let user = try? snapshot?.data(as: User.self)
            else {
                print("DEBUG: Guard let error unable to get user object from snapshot!")
                return
            }
            
            print("DEBUG: User object is \(user)")
            self.currentUser = user
        }
    }
}
