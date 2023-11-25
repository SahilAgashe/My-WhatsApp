//
//  User.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 25/11/23.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}
