//
//  StatusSelectorView.swift
//  My-WhatsApp
//
//  Created by SAHIL AMRUT AGASHE on 05/11/23.
//

import SwiftUI

struct StatusSelectorView: View {
    
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
                    
                    StatusCell(viewModel: StatusViewModel(rawValue: 4)!)
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundColor(Color.gray)
                        .padding()
                    
                    ForEach(StatusViewModel.allCases.filter({$0 != .notConfigured}), id: \.self) { viewModel in
                        Button {
                            print("DEBUG: button pressed to change status!")
                        } label: {
                            StatusCell(viewModel: viewModel)
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
    
    let viewModel: StatusViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.title)
                .foregroundColor(.black)
            Spacer()
        }
        .frame(height: 56)
        .padding([.horizontal])
        .background(Color.white)
    }
}
