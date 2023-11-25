//
//  NewMessageViewModel.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 25/11/23.
//

import SwiftUI
import Firebase


class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { (snapshot: QuerySnapshot?, error:Error?) in
            guard let documents = snapshot?.documents else {
                print("DEBUG: Guard let error unable to get documents from snapshot!")
                return
            }
            
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
            print("DEBUG: users are \(self.users)")
        }
    }
    
}
