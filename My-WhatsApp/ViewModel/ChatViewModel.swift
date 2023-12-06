//
//  ChatViewModel.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 08/11/23.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    
    init() {
    }
    
    
    func sendMessage(_ messageText: String) {
    }
}
