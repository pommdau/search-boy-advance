//
//  DetailCellView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct DetailCellView: View {

    var title: String?
    var text: String
    var isHashtags = false

    var body: some View {
        
        if let title = title {
            HStack {
                Text(title)
                Spacer()
                Text(text)
            }
        } else {
            if isHashtags {
                Text("# \(text)")
                    .foregroundColor(.twitterBlue)
            } else {
                Text(text)
            }
        }
    }
}

struct DetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailCellView(title: "Title", text: "Text", isHashtags: false)
                .padding()
            .previewLayout(.fixed(width: 400, height: 200))
            
            DetailCellView(text: "Text", isHashtags: true)
                .padding()
                .previewLayout(.fixed(width: 400, height: 200))
        }
        
    }
}
