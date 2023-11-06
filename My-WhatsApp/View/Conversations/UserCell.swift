//
//  UserCell.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 06/11/23.
//

import SwiftUI

struct UserCell: View {
    
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
                    Text("Sahil")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Sahil Agashe")
                        .font(.system(size: 15))
                }
                .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .padding(.top)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
