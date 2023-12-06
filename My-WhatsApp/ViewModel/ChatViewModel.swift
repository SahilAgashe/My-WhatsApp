//
//  ChatViewModel.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 08/11/23.
//

import Firebase

class ChatViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    let user: User // chatPartnerUser
    
    init(user: User) {
        self.user = user
    }
    
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatPartnerId = user.id else { return }
        
        // NOTE: both CurrentUser-ChatPartner and ChatPartner-CurrentUser path having same documentId, no need to create different documents.
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = COLLECTION_MESSAGES.document(chatPartnerId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = [
            "text": messageText,
            "fromId": currentUid,
            "toId": chatPartnerId,
            "read": false,
            "timestamp": Timestamp(date: Date())
        ]
        
        currentUserRef.setData(data)
        chatPartnerRef.document(messageId).setData(data)
    }
}
