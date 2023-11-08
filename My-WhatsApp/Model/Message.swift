//
//  Message.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 08/11/23.
//

import Foundation

struct Message: Identifiable {
    let id = NSUUID().uuidString
    let isFromCurrentUser: Bool
    let messageText: String
}
