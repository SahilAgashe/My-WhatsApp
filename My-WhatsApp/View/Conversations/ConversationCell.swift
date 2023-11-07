//
//  ConversationCell.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 06/11/23.
//

import SwiftUI

struct ConversationCell: View {
    
    var body: some View {
        VStack {
            HStack {
                Image("saa")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                // message info
                VStack(alignment: .leading, spacing: 4) {
                    Text("Sahil Agashe")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Hii, How are you?")
                        .font(.system(size: 15))
                }
                .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.horizontal)
            
            Divider()
        }
        .padding(.top)
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
