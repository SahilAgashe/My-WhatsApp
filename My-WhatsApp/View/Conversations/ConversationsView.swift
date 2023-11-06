//
//  ConversationsView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 03/11/23.
//

import SwiftUI
 
struct ConversationsView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            // chats
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach((0 ... 10), id: \.self) { element in
                        ConversationCell()
                    }
                }
            }
            
            // floating button
            Button {
                print("Show user list sheet...")
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

        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
