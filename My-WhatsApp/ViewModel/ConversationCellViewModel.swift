//
//  ConversationCellViewModel.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 07/12/23.
//

import Foundation
import Firebase

class ConversationCellViewModel: ObservableObject {
    @Published var message: Message
    
    init(_ message: Message) {
        self.message = message
        fetchUser()
    }
    
    var chatPartnerId: String {
        return message.fromId == AuthViewModel.shared.userSession?.uid ? message.toId : message.fromId
    }
    
    var chatPartnerProfileImageUrl: URL? {
        guard let user = message.user else { return nil }
        return URL(string: user.profileImageUrl)
    }
    
    var fullname: String {
        guard let user = message.user else { return "" }
        return user.fullname
    }
    
    func fetchUser() {
        COLLECTION_USERS.document(chatPartnerId).getDocument { (snapshot: DocumentSnapshot?, error: Error?) in
            self.message.user = try? snapshot?.data(as: User.self)
        }
    }
}
