//
//  DetailCellView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct DetailCellView: View {

    let title: String
    let text: String
    var rightTextColor: Color = .secondary

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(text)
                .foregroundColor(rightTextColor)
        }
    }
}

struct DetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCellView(title: "Name",
                       text: "Hoge\nFuga\nHogo")
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
