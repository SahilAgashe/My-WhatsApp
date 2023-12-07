//
//  ConversationsViewModel.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 07/12/23.
//

import Foundation
import Firebase

class ConversationsViewModel: ObservableObject {
    @Published var recentMessages = [Message]()
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_MESSAGES.document(uid)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
        
        query.getDocuments { (snapshot: QuerySnapshot?, error: Error?) in
            guard let documents = snapshot?.documents else { return }
            self.recentMessages = documents.compactMap({ try? $0.data(as: Message.self)})
        }
    }
}
