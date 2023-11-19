//
//  ProfilePhotoSelectorView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 12/11/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
            // Button
            Button {
                imagePickerPresented.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 180)
                        .clipShape(Circle())
                } else {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 44)
                        .foregroundColor(Color.black)
                }
            }
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                ImagePicker(image: $selectedImage)
            }
            
            // Text
            Text(profileImage == nil ? "Select a profile photo" : "Great! Tap below to continue")
                .font(.system(size: 20, weight: .semibold))
            
            if let image = selectedImage {
                // Button
                Button {
                    viewModel.uploadProfileImage(image)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }

            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
