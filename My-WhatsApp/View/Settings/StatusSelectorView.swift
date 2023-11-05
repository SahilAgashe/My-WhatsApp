//
//  StatusSelectorView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 05/11/23.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusViewModel()
    
    // MARK: - body
    var body: some View {
        ZStack {
            Color(UIColor.systemGroupedBackground)
                .ignoresSafeArea()
            
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("CURRENTLY SET TO")
                        .foregroundColor(Color.gray)
                        .padding()
                    
                    StatusCell(status: viewModel.status)
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundColor(Color.gray)
                        .padding()
                    
                    ForEach(UserStatus.allCases.filter({$0 != .notConfigured}), id: \.self) { status in
                        Button {
                            print("DEBUG: button pressed to change status!")
                            viewModel.updateStatus(status)
                        } label: {
                            StatusCell(status: status)
                        }

                    }
                }
        
            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}

struct StatusCell: View {
    
    let status: UserStatus
    
    var body: some View {
        HStack {
            Text(status.title)
                .foregroundColor(.black)
            Spacer()
        }
        .frame(height: 56)
        .padding([.horizontal])
        .background(Color.white)
    }
}
