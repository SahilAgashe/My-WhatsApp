//
//  Extensions.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 07/11/23.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
