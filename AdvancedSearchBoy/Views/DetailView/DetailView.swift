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
                words()

                if !option.hashtags.isEmpty {
                    DetailCellView(title: "Hashtags",
                                   words: option.hashtags,
                                   isHashtags: true)
                }

                if !option.excludingWords.isEmpty {
                    DetailCellView(title: "Excluded words",
                                   words: option.excludingWords)
                }
            }

//            if !option.filtersString.isEmpty {
//                Section("Filters") {
//                    DetailCellView(title: "Including",
//                                   words: [option.filtersString])
//                }
//            }

            if option.minFavorites > 0 || option.minRetweets > 0 {
                Section("Engagements") {
                    if option.minFavorites > 0 {
                        DetailCellView(title: "Minimum favorites",
                                       words: [Word(value: String(option.minFavorites))])
                    }

                    if option.minRetweets > 0 {
                        DetailCellView(title: "Minimum retweets",
                                       words: [Word(value: String(option.minRetweets))])
                    }
                }
            }

            if option.createdSince != nil || option.createdUntil != nil {
                Section("Dates") {
                    if let createdSince = option.createdSince {
                        DetailCellView(title: "Since",
                                       words: [Word(value: createdSince.toString())])
                    }

                    if let createdUntil = option.createdUntil {
                        DetailCellView(title: "Until",
                                       words: [Word(value: createdUntil.toString())])
                    }
                }
            }
        }
        .navigationTitle(option.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = option.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(data.title)
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
                            .disabled(data.title.isEmpty)
                        }
                    }
            }
        }
    }
    
    @ViewBuilder
    private func words() -> some View {
        if !option.words.isEmpty {
            DetailCellView(title: "Words",
                           words: option.words)
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
