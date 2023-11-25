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
    @State private var searchText = ""
    @State private var isEditing = false
    @ObservedObject var viewModel = NewMessageViewModel()
    
    var body: some View {
        ScrollView {
            
            SearchBar(text: $searchText, isEditing: $isEditing)
                .onTapGesture {
                    isEditing.toggle()
                }
                .padding()
            
            
            VStack(alignment: .leading) {
                ForEach(viewModel.users) { user in
                    Button {
                        showChatView.toggle()
                        mode.wrappedValue.dismiss()
                    } label: {
                        UserCell(user: user)
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
