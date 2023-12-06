//
//  MessageView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 07/11/23.
//

import SwiftUI
import Firebase
import Kingfisher

struct MessageView: View {
    
    let viewModel: MessageViewModel
    
    var body: some View {
        HStack {
            if viewModel.isFromCurrentUser {
                Spacer()
                
                Text(viewModel.message.text)
                    .padding(12)
                    .background(Color.blue)
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.leading, 100)
            } else {
                HStack(alignment: .bottom) {
                    KFImage(viewModel.profileImageUrl)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    
                    Text(viewModel.message.text)
                        .padding(12)
                        .background(Color(UIColor.systemGray5))
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.trailing, 80)
                
                Spacer()
            }
        }
    }
}

// MARK: - Uncomment Previews Whenever Required
//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView(viewModel: MessageViewModel(message: Message(id: "", fromId: "", toId: "", read: false, text: "Hi Sahil, how are you?", timestamp: Timestamp())))
//    }
//}
