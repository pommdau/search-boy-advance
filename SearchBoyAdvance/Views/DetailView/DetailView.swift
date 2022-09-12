//
//  DetailView.swift
//  SearchBoyAdvance
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
        option.mediaType != .none ||
        option.language != .none ||
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
        }
    }
        
    @ViewBuilder
    private func filtersSection() -> some View {
        if isFiltersSectionValud {
            Section("Filters") {
                if option.mediaType != .none {
                    DetailCellView(type: .titleAndText("Media".localize, option.mediaType.name.localize))
                }
                
                if option.language != .none {
                    DetailCellView(type: .titleAndText("Language".localize, option.language.name.localize))
                }
                
                if option.isSafeSearch {
                    DetailCellView(type: .titleAndCheckmark("Safe Search".localize))
                }
            }
        }
    }
    
    @ViewBuilder
    private func engagementSection() -> some View {
        if option.minFavorites > 0 || option.minRetweets > 0 {
            Section("Engagements") {
                if option.minFavorites > 0 {
                    DetailCellView(type: .titleAndText("Minimum favorites".localize, String(option.minFavorites)))
                }

                if option.minRetweets > 0 {
                    DetailCellView(type: .titleAndText("Minimum retweets".localize, String(option.minRetweets)))
                }
            }
        }
    }
    
    @ViewBuilder
    private func sortSection() -> some View {
        Section("Sort") {
            DetailCellView(type: .text(option.sortedType.name))
        }
    }
    
    @ViewBuilder
    private func tweetedBySection() -> some View {
        if !option.user.isEmpty || option.onlyFollowing {
            Section("Tweeted by") {
                if !option.user.isEmpty {
                    DetailCellView(type: .titleAndText("User".localize, "@ \(option.user)"))
                }
                
                if option.onlyFollowing {
                    DetailCellView(type: .titleAndCheckmark("Only Following".localize))
                }
            }
        }
    }
    
    @ViewBuilder
    private func dateSection() -> some View {
        if option.createdSince != nil || option.createdUntil != nil {
            Section("Date") {
                if let createdSince = option.createdSince {
                    DetailCellView(type: .titleAndText("Since".localize, createdSince.toDisplayString()))
                }
                
                if let createdUntil = option.createdUntil {
                    DetailCellView(type: .titleAndText("Until".localize, createdUntil.toDisplayString()))
                }
                
                if option.timeZone != .none {
                    DetailCellView(type: .titleAndText("TimeZone".localize, option.timeZone.name))
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["ja", "en"], id: \.self) { id in
            NavigationView {
                DetailView(option: .constant(TwitterOption.sampleData[1]))
            }
            .environment(\.locale, .init(identifier: id))
        }
    }
}
