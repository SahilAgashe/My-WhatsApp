//
//  My_WhatsAppApp.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 02/11/23.
//

import SwiftUI

@main
struct My_WhatsAppApp: App {
    var body: some Scene {
        WindowGroup {
           MainTabView()
        }
    }
}

struct MyWhatsApp_Preview: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
