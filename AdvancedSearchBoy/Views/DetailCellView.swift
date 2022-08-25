//
//  DetailCellView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct DetailCellView: View {
    
    let name: String
    let includingText: String
    let excludingText: String
    
    var body: some View {
        HStack {
            Text(name)
            Spacer()
            VStack(alignment: .trailing) {
                if !includingText.isEmpty {
                    Text(includingText)
                        .foregroundColor(.secondary)
                }
                
                if !excludingText.isEmpty {
                    Text(excludingText)
                        .foregroundColor(.red.opacity(0.8))
                }
            }
        }
    }
}

struct DetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCellView(name: "Name",
                       includingText: "Hoge\nFuga\nHogo",
                       excludingText: "Piyo\nPogo\nPoem")
        .previewLayout(.fixed(width: 400, height: 200))
    }
}
