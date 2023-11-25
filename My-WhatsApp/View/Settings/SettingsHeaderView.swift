//
//  SettingsHeaderView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 04/11/23.
//

import SwiftUI

struct SettingsHeaderView: View {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    // MARK: body
    var body: some View {
        HStack {
            Image("saa")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
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

// MARK: Uncomment Previews Whenever Required
//struct SettingsHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsHeaderView()
//    }
//}
