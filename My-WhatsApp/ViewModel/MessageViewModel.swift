//
//  MessageViewModel.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 06/12/23.
//

import Foundation

struct MessageViewModel {
    let message: Message
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
}