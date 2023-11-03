//
//  RegistrationView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 03/11/23.
//

import SwiftUI

struct RegistrationView: View {
    
    // MARK: - properties
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    @Environment(\.presentationMode) var mode
    
    // MARK: - body
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack { Spacer() }
                
                Text("Get Started,")
                    .font(.largeTitle)
                    .bold()
                
                Text("Create your account.")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                VStack(spacing: 42) {
                    CustomTextField(imageName: "envelope",
                                    placeholderText: "Email",
                                    text: $email,
                                    isSecureField: false)
                    
                    CustomTextField(imageName: "person",
                                    placeholderText: "Username",
                                    text: $username,
                                    isSecureField: false)
                    
                    CustomTextField(imageName: "person",
                                    placeholderText: "Fullname",
                                    text: $fullname,
                                    isSecureField: false)
                    
                    CustomTextField(imageName: "lock",
                                    placeholderText: "Password",
                                    text: $password,
                                    isSecureField: true)
                    

                    
                }.padding([.top, .horizontal], 32)

            }
            .padding(.leading)
            
            Button {
                print("Handle sing up..")
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .padding(.top, 24)
            .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
            
            Spacer()
            
            Button {
                mode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                }
            }
            .padding(.bottom, 32)

        }
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
