//
//  ConversationCell.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 06/11/23.
//

import SwiftUI

struct ConversationCell: View {
    let viewModel: MessageViewModel
    
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
                    
                    Text(viewModel.message.text)
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

// MARK: - Uncomment Previews Whenever Required
//struct ConversationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ConversationCell()
//    }
//}
