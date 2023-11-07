//
//  MessageView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 07/11/23.
//

import SwiftUI

struct MesssageView: View {
    
    var isFromCurrentUser: Bool
    
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                
                Text("Hii, How are you.Hii, How are you.Hii, How are you.Hii, How are you.Hii, How are you.Hii, How are you.Hii, How are you.")
                    .padding(12)
                    .background(Color.blue)
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.leading, 100)
            } else {
                HStack(alignment: .bottom) {
                    Image("saa")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    
                    Text("Hii, How are you.Hii, How are you.Hii, How are you.Hii, How are you.Hii, How are you.Hii, How are you.Hii, How are you.")
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

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MesssageView(isFromCurrentUser: true)
        MesssageView(isFromCurrentUser: false)
    }
}
