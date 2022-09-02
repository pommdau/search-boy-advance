//
//  DetailCellView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct DetailCellView: View {

    let title: String
    let words: [String]
    var rightTextColor: Color = .secondary

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            VStack(alignment: .trailing) {
                ForEach(words, id: \.self) { word in
                    Text(word)
                }
            }
            .foregroundColor(rightTextColor)
        }
    }
}

struct DetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCellView(title: "Name",
                       words: ["Hogeeee", "Fuga", "Hogo"])
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
