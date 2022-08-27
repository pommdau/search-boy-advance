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

            if option.minFavorites > 0 || option.minRetweets > 0 {
                Section("Engagements") {
                    if option.minFavorites > 0 {
                        DetailCellView(title: "Minimum favorites",
                                       text: String(option.minFavorites))
                    }

                    if option.minRetweets > 0 {
                        DetailCellView(title: "Minimum retweets",
                                       text: String(option.minRetweets))
                    }
                }
            }

            if option.createdSince != nil || option.createdUntil != nil {
                Section("Dates") {
                    if option.createdSince != nil {
                        DetailCellView(title: "Since",
                                       text: "2022-08-28")
                    }

                    if option.createdUntil != nil {
                        DetailCellView(title: "Until",
                                       text: "2022-08-28")
                    }
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
