//
//  SettingsHeaderView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 04/11/23.
//

import SwiftUI

struct SettingsHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Sahil Agashe")
                    .font(.system(size: 18))
                
                Text("Available")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
        .frame(height: 80)
        .background(Color.white)
    }
}
