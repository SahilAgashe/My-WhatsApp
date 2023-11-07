//
//  ChatView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 03/11/23.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            
            // messages
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach((0 ... 10), id: \.self) { element in
                        MesssageView(isFromCurrentUser: element % 2 == 0)
                    }
                }
            }
            
            // input view
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle("Sahil Agashe")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    func sendMessage() {
        print("DEBUG: sendMessage() called, message ==> \(messageText)")
        messageText = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
