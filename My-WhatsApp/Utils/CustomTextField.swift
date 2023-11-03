//
//  CustomTextField.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 03/11/23.
//

import SwiftUI

struct CustomTextField: View {
    
    // MARK: - properties
    
    let imageName: String
    let placeholderText: String
    @Binding var text: String
    let isSecureField: Bool
    
    // MARK: - body
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(UIColor.darkGray))
                
                if isSecureField {
                    SecureField(placeholderText, text: $text)
                } else {
                    TextField(placeholderText, text: $text)
                }
                
            }
            
            Divider()
                .background(Color(UIColor.darkGray))
        }
    }
}
