//
//  EditProfileView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 04/11/23.
//

import SwiftUI

struct EditProfileView: View {
    
    // MARK: - properties
    
    @State private var fullname = "Sahil Agashe"
    
    // MARK: - body
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 44) {
                // header
                
                VStack {
                    // photo / edit button/ text
                    HStack {
                        // photo / edit button
                        VStack {
                            Image("saa")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                            
                            Button {
                                print("DEBUG: change profile photo here.")
                            } label: {
                                Text("Edit ")
                            }
                        }
                        .padding(.top)
                        
                        Text("Enter your name or change your profile photo!")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding([.bottom, .horizontal])
                        
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                    TextField("", text: $fullname)
                        .padding()
                }
                .background(Color.white)
                
                // status
                
                VStack(alignment: .leading) {
                    // status
                    Text("Status")
                        .padding()
                        .foregroundColor(.gray)
                    
                    // edit status navigation link
                    NavigationLink {
                        StatusSelectorView()
                    } label: {
                        HStack {
                            Text("At the movie")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(.white)
                    }
                }
                
                Spacer()
            }
            .padding(.top)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
