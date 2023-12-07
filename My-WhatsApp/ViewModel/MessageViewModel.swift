//
//  MessageViewModel.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 06/12/23.
//

import Foundation
import Firebase

class MessageViewModel: ObservableObject {
    @Published var user: User?
    let message: Message
    
    init(_ message: Message) {
        self.message = message
    }
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.profileImageUrl else { return nil }
        return URL(string: profileImageUrl)
    }
    
    var chatPartnerId: String {
        return message.fromId == currentUid ? message.toId : message.fromId
    }
    
    var chatPartnerProfileImageUrl: URL? {
        guard let user = user else { return nil }
        return URL(string: user.profileImageUrl)
    }
    
    var fullname: String {
        guard let user = user else { return "" }
        return user.fullname
    }
    
    func fetchUser() {
        COLLECTION_USERS.document(chatPartnerId).getDocument { (snapshot: DocumentSnapshot?, error: Error?) in
            self.user = try? snapshot?.data(as: User.self)
        }
    }
}
