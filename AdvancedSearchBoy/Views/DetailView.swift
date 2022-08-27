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

                //                if !option.words.isEmpty || !option.excludingWords.isEmpty {
                //                    NavigationLink {
                //                        DetailEditView(includings: $option.words,
                //                                       excludings: $option.excludingWords)
                //                    } label: {
                //                        DetailCellView(name: "Word",
                //                                       includingText: option.words.joined(separator: "\n"),
                //                                       excludingText: option.excludingWords.joined(separator: "\n"))
                //                    }
                //                }
                //
                //                if !option.titles.isEmpty || !option.excludingTitles.isEmpty {
                //                    DetailCellView(name: "Title",
                //                                   includingText: option.titles.joined(separator: "\n"),
                //                                   excludingText: option.excludingTitles.joined(separator: "\n"))
                //                }
                //
                //                if !option.bodies.isEmpty || !option.excludingBodies.isEmpty {
                //                    DetailCellView(name: "Body text",
                //                                   includingText: option.bodies.joined(separator: "\n"),
                //                                   excludingText: option.excludingBodies.joined(separator: "\n"))
                //                }
                //
                //                if !option.codes.isEmpty || !option.excludingCodes.isEmpty {
                //                    DetailCellView(name: "Code",
                //                                   includingText: option.codes.joined(separator: "\n"),
                //                                   excludingText: option.excludingCodes.joined(separator: "\n"))
                //                }
            }

            // TODO: Created

            //            Section("Meta Data") {
            //                DetailCellView(name: "Sort",
            //                               includingText: option.sort.displayTitle,
            //                               excludingText: "")
            //
            //                if !option.tags.isEmpty || !option.excludingTags.isEmpty {
            //                    DetailCellView(name: "Tag",
            //                                   includingText: option.tags.joined(separator: "\n"),
            //                                   excludingText: option.excludingTags.joined(separator: "\n"))
            //                }
            //
            //                if !option.users.isEmpty || !option.users.isEmpty {
            //                    DetailCellView(name: "User",
            //                                   includingText: option.users.joined(separator: "\n"),
            //                                   excludingText: option.excludingUsers.joined(separator: "\n"))
            //                }
            //
            //                if option.minStocks != nil || option.maxStocks != nil {
            //                    DetailCellView(name: "Stock",
            //                                   includingText: option.minStocks != nil ? "min: \(option.minStocks ?? 0)" : "",
            //                                   excludingText: option.maxStocks != nil ? "max: \(option.maxStocks ?? 0)" : "")
            //                }
            //            }
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
