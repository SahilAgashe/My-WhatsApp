//
//  ConversationsView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 03/11/23.
//

import SwiftUI
 
struct ConversationsView: View {
    
    @State private var showNewMessageView = false
    @State private var showChatView = false
    @State private var selectedUser: User?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let user = selectedUser {
                NavigationLink(destination: ChatView(user: user),
                               isActive: $showChatView,
                               label: {})
            }
            
            // chats
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach((0 ... 10), id: \.self) { element in
                        NavigationLink {
                            ChatView(user: MOCK_USER)
                        } label: {
                            ConversationCell()
                        }

                    }
                }
            }
            
            // floating button
            Button {
                print("DEBUG: Show user list sheet...")
                showNewMessageView.toggle()
            } label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding()
            }
            .background(Color(UIColor.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $showNewMessageView) {
                NewMessageView(showChatView: $showChatView, user: $selectedUser)
            }

        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
