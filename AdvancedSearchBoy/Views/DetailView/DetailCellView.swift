//
//  DetailCellView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct DetailCellView: View {
    
    enum CellType {
        case titleAndText(String, String)
        case titleAndCheckmark(String)
        case text(String)
        case hashtag(String)
    }

    let type: CellType

    var body: some View {
        
        switch type {
        case let .titleAndText(title, text):
            HStack {
                Text(title)
                Spacer()
                Text(text)
            }
        case .titleAndCheckmark(let title):
            HStack {
                Text(title)
                Spacer()
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.twitterBlue)
            }
        case .text(let text):
            Text(text)
        case .hashtag(let text):
            Text("# \(text)")
                .foregroundColor(.twitterBlue)
        }
    }
}

struct DetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailCellView(type: .hashtag("hogehoge"))
        }
        
    }
}
