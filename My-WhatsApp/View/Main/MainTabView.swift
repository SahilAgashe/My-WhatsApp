//
//  MainTabView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 03/11/23.
//

import SwiftUI

struct MainTabView: View {
    
    // MARK: - Properties
    @State private var selectedIndex = 0
    
    // MARK: - initializers
    init() {
        UITabBar.appearance().backgroundColor = UIColor.secondarySystemBackground
        UITabBar.appearance().isTranslucent = false
        print("DEBUG: From init selected index is \(selectedIndex)")
    }
    
    // MARK: - body
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                ConversationsView()
                    .tabItem { Image(systemName: "bubble.left") }
                    .tag(0)
                
                ChannelsView()
                    .tabItem { Image(systemName: "bubble.left.and.bubble.right") }
                    .tag(1)
                
                SetttingsView()
                    .tabItem { Image(systemName: "gear") }
                    .tag(2)
            }
            .navigationTitle(tabTitle)
        }
    }
    
    // MARK: - Properties
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Chats"
        case 1: return "Channels"
        case 2: return "Settings"
        default: return ""
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
