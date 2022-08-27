//
//  DetailView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct DetailView: View {

    @Binding var option: TwitterOption

    var body: some View {
        List {
            Section("Words") {
                if !option.words.isEmpty {
                    DetailCellView(title: "Words",
                                   text: option.words.joined(separator: "\n"))
                }

                if !option.hashtags.isEmpty {
                    DetailCellView(title: "Hashtags",
                                   text: option.hashtagsString,
                                   rightTextColor: .twitterBlue)
                }

                if !option.excludingWords.isEmpty {
                    DetailCellView(title: "Excluded words",
                                   text: option.excludingWords.joined(separator: "\n"))
                }
            }
            
            if !option.filtersString.isEmpty {
                Section("Filters") {
                    DetailCellView(title: "Including",
                                   text: option.filtersString)
                }
            }
        }
        .navigationTitle(option.name)
        .toolbar {
            Button("Edit") {
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(option: .constant(TwitterOption.sampleData[0]))
        }
    }
}
