//
//  NewMessageView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 06/11/23.
//

import SwiftUI

struct NewMessageView: View {
    
    @Binding var showChatView: Bool
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach((0 ... 10), id: \.self) { element in
                    Button {
                        showChatView.toggle()
                        mode.wrappedValue.dismiss()
                    } label: {
                        UserCell()
                    }

                }
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(showChatView: .constant(true))
    }
}
