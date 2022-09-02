//
//  DetailCellView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct DetailCellView: View {

    let title: String
    let words: [Word]
    var isHashtags = false

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            VStack(alignment: .trailing) {
                ForEach(words) { word in
                    if isHashtags {
                        Text("# \(word.value)")
                    } else {
                        Text(word.value)
                    }
                }
                .foregroundColor(isHashtags ? .twitterBlue : .label)
            }
        }
    }
}

struct DetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCellView(title: "Name",
                       words: [Word(value: "Hoge"), Word(value: "Pogoooooo"), Word(value: "Fuga")])
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
