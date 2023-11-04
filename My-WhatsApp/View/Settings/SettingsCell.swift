//
//  SettingsCell.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 04/11/23.
//

import SwiftUI

struct SettingsCell: View {
    
    // MARK: - body
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .padding(6)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                
                Text("Starred Messages")
                    .font(.system(size: 15))
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding([.top, .horizontal])
            
            Divider()
                .padding(.leading)
        }
        .background(Color.white)
    }
}

struct SettingsCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCell()
    }
}
