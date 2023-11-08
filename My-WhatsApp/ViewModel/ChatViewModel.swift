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
        messages = mockMessages
    }
    
    var mockMessages: [Message] {
        [
            .init(isFromCurrentUser: true, messageText: "Hii"),
            .init(isFromCurrentUser: false, messageText: "Hello"),
            .init(isFromCurrentUser: true, messageText: "How are you"),
            .init(isFromCurrentUser: false, messageText: "As usual"),
            .init(isFromCurrentUser: true, messageText: "What abou you"),
            .init(isFromCurrentUser: false, messageText: "How are you doc"),
            .init(isFromCurrentUser: true, messageText: "He khup zhala ata , marathi bolu aapan"),
            .init(isFromCurrentUser: false, messageText: "hoo"),
            .init(isFromCurrentUser: false, messageText: "As usual"),
            .init(isFromCurrentUser: true, messageText: "What abou you"),
            .init(isFromCurrentUser: false, messageText: "How are you doc"),
            .init(isFromCurrentUser: true, messageText: "He khup zhala ata , marathi bolu aapan"),
            .init(isFromCurrentUser: false, messageText: "hoo")
        ]
    }
    
    func sendMessage(_ messageText: String) {
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)
    }
}
