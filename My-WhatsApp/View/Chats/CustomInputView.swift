//
//  CustomInputView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 07/11/23.
//

import SwiftUI

struct CustomInputView: View {
    
    @Binding var text: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(UIColor.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
            
            HStack {
                TextField("Message", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.body)
                    .frame(minHeight: 30)
                
                Button {
                    action()
                    print("DEBUG: Button Sending message...")
                } label: {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom, 8)
            .padding(.horizontal)
        }
    }
}

struct CustomInputView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputView(text: Binding<String>.constant("Hii, Sahil"), action: {})
    }
}
