//
//  My_WhatsAppApp.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 02/11/23.
//

import SwiftUI
import FirebaseCore
import Firebase

@main
struct My_WhatsAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}

struct MyWhatsApp_Preview: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthViewModel.shared)
    }
}
