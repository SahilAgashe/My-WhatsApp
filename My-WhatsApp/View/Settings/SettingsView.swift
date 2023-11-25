//
//  SettingsView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 03/11/23.
//

import SwiftUI

struct SettingsView: View {
    
    private let user: User
    
    // MARK: - Initializers
    init(user: User) {
        self.user = user
    }
    
    // MARK: - body
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                NavigationLink {
                    EditProfileView()
                } label: {
                    SettingsHeaderView(user: user)
                }

                
                VStack(spacing: 1) {
                    ForEach.init(SettingsCellViewModel.allCases, id: \.self) {viewModel in
                        SettingsCell(viewModel: viewModel)
                    }
                }
                
                Button {
                    print("Log Out Button Pressed!!")
                    AuthViewModel.shared.signout()
                } label: {
                    Text("Log Out")
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width, height: 50)
                        .background(Color.white)
                }

                Spacer()
            }
            .padding(.top)
        }
    }
}

// MARK: Uncomment Previews Whenever Required
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView(user: User(username: "", fullname: "", email: "", profileImageUrl: ""))
//    }
//}
