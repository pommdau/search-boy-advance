//
//  DetailView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct DetailView: View {

    @Binding var option: TwitterOption
    @State private var data = TwitterOption.Data()
    @State private var isPresentingEditView = false

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
                    if let createdSince = option.createdSince {
                        DetailCellView(title: "Since",
                                       text: createdSince.toString())
                    }

                    if let createdUntil = option.createdUntil {
                        DetailCellView(title: "Until",
                                       text: createdUntil.toString())
                    }
                }
            }
        }
        .navigationTitle(option.name)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = option.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(data.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                option.update(from: data)
                            }
                        }
                    }
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
