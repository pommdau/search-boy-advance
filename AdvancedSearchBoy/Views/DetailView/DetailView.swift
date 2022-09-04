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
            wordsSection()
            excludingWordsSection()
            hashtagsSection()
            filtersSection()
            engagementSection()
            sortSection()
            tweetedBySection()
            dateSection()
        }
        .navigationTitle(option.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = option.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            detailEditView()
        }
    }
}

extension DetailView {
    @ViewBuilder
    private func detailEditView() -> some View {
        NavigationView {
            DetailEditView(data: $data)
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

extension DetailView {
    
    private var isFiltersSectionValud: Bool {
        option.mediaType != .none &&
        option.language != .none &&
        option.isSafeSearch
    }
        
    @ViewBuilder
    private func wordsSection() -> some View {
        if !option.words.isEmpty {
            Section("Words") {
                ForEach(option.words) { word in
                    Text(word.value)
                }
            }
            .textCase(nil)
        }
    }
    
    @ViewBuilder
    private func excludingWordsSection() -> some View {
        if !option.excludingWords.isEmpty {
            Section("Excluding Words") {
                ForEach(option.excludingWords) { excludingWords in
                    Text(excludingWords.value)
                }
            }
            .textCase(nil)
        }
    }
    
    @ViewBuilder
    private func hashtagsSection() -> some View {
        if !option.hashtags.isEmpty {
            Section("Hashtags") {
                ForEach(option.hashtags) { hashtag in
                    Text("#\(hashtag.value)")
                        .foregroundColor(.twitterBlue)
                }
            }
            .textCase(nil)
        }
    }
        
    @ViewBuilder
    private func filtersSection() -> some View {
        if isFiltersSectionValud {
            Section("Filters") {
                if option.mediaType != .none {
                    DetailCellView(title: "Media", text: option.mediaType.name)
                }
                
                if option.language != .none {
                    DetailCellView(title: "Language", text: option.language.name)
                }
                
                if option.isSafeSearch {
                    DetailCellView(title: "Safe Search",
                                   text: "On")
                }
            }
        }
    }
    
    @ViewBuilder
    private func engagementSection() -> some View {
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
    }
    
    @ViewBuilder
    private func sortSection() -> some View {
        Section("Sorted") {
            DetailCellView(text: option.sortedType.name)
        }
    }
    
    @ViewBuilder
    private func tweetedBySection() -> some View {
        if option.user != nil || option.onlyFollowing {
            Section("Tweeted by") {
                if let user = option.user {
                    DetailCellView(title: "User", text: "@\(user)")
                }
                
                if option.onlyFollowing {
                    DetailCellView(title: "Only Following", text: "ON")
                }
            }
        }
    }
    
    @ViewBuilder
    private func dateSection() -> some View {
        if option.createdSince != nil || option.createdUntil != nil {
            Section("Date") {
                if let createdSince = option.createdSince {
                    DetailCellView(title: "Since", text: createdSince.toString())
                }
                
                if let createdUntil = option.createdUntil {
                    DetailCellView(title: "Until", text: createdUntil.toString())
                }
            }
        }
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(option: .constant(TwitterOption.sampleData[2]))
        }
    }
}
