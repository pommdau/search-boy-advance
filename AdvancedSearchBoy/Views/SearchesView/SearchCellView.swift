//
//  SearchCellView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/09/01.
//

import SwiftUI

struct SearchCellView: View {
    
    @Binding var option: TwitterOption
    
    var body: some View {
        NavigationLink {
            DetailView(option: $option)
        } label: {
            HStack {
                Text("\(option.title)")
                Spacer()
                Button {
                    print("copy...")
                } label: {
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(.blue)
                }
                Button {
                    guard let url = option.url else {
                        return
                    }
                    UIApplication.shared.open(url)  // TODO: Handle macOS
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.blue)
                        .padding(.trailing, 10)
                }
            }
            .buttonStyle(.plain)
        }
    }
}

struct SearchCellView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCellView(option: .constant(TwitterOption.sampleData[0]))
            .previewLayout(.fixed(width: 400, height: 120))
            .padding()
    }
}
