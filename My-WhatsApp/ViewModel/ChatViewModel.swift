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
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatPartnerId = user.id else { return }
        
        let query = COLLECTION_MESSAGES
            .document(currentUid)
            .collection(chatPartnerId)
            .order(by: "timestamp", descending: false)
        
//        // for fetching all documents, but not realtime-updating
//        query.getDocuments { (snapshot: QuerySnapshot?, error: Error?) in
//            guard let documents = snapshot?.documents else { return }
//            var messages = documents.compactMap({ try? $0.data(as: Message.self)})
//            
//            for (index, message) in messages.enumerated() where message.fromId != currentUid {
//                // setting user , for message not from current user
//                messages[index].user = self.user
//            }
//            
//            self.messages = messages
//            print("DEBUG: messages are \(self.messages)")
//        }
        
        // for fetching all documents with realtime updating whenever new document is added
        query.addSnapshotListener { (snapshot: QuerySnapshot?, error: Error?) in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            var messages = changes.compactMap({try? $0.document.data(as: Message.self)})
            
            for (index, message) in messages.enumerated() where message.fromId != currentUid {
                // setting user , for message not from current user
                messages[index].user = self.user
            }
            
            self.messages.append(contentsOf: messages)
            print("DEBUG: messages are \(self.messages)")
        }
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
