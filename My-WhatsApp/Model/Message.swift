//
//  Message.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 08/11/23.
//

import Firebase
import FirebaseFirestoreSwift


struct Message: Identifiable {
    @DocumentID var id : String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
}
