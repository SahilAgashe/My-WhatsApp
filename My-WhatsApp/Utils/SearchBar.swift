//
//  SearchBar.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 06/11/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 28)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                .overlay {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                }
        
            if isEditing {
                Button {
                    print("DEBUG: isEditing true, got button!")
                    isEditing = false
                    text = ""
                    // need to dismiss keyboard
                    UIApplication.shared.endEditing()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
            
        }
        

    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: Binding<String>.constant("Search..."), isEditing: Binding<Bool>.constant(false))
    }
}
