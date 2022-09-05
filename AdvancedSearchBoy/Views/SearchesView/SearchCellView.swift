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
                    guard let url = option.url else {
                        return
                    }
                    print(url.absoluteString)
                    UIApplication.shared.open(url)
                } label: {
                    Label("Open", systemImage: "square.and.arrow.up")
                        .labelStyle(.trailingIcon)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.twitterBlue)
                        .cornerRadius(4)
                        .foregroundColor(.white)
                }
                .padding(.trailing, 8)
            }
            .buttonStyle(.plain)
        }
    }
}

struct SearchCellView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchCellView(option: .constant(TwitterOption.sampleData[0]))
        }
        .previewLayout(.fixed(width: 400, height: 120))
        .padding()
            
    }
}
