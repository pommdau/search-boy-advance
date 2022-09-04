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

//            if option.createdSince != nil || option.createdUntil != nil {
//                Section("Dates") {
//                    if let createdSince = option.createdSince {
//                        DetailCellView(title: "Since",
//                                       words: [Word(value: createdSince.toString())])
//                    }
//
//                    if let createdUntil = option.createdUntil {
//                        DetailCellView(title: "Until",
//                                       words: [Word(value: createdUntil.toString())])
//                    }
//                }
//            }
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
        HStack {
            Text("Sorted")
                .padding(.trailing, 4)
            Picker(selection: $data.sortedType, label: Text("Sorted")) {
                Text(TwitterOption.SortedType.featured.name).tag(TwitterOption.SortedType.featured)
                Text(TwitterOption.SortedType.live.name).tag(TwitterOption.SortedType.live)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
    
    @ViewBuilder
    private func tweetedBySection() -> some View {
        Section("Tweeted by") {
            HStack {
                Text("User")
                Spacer()
                HStack(alignment: .center) {
                    Text("@")
                        .offset(x: 6)
                    TextField(text: $data.title) {
                        Text("user")
                    }
                    .lineLimit(1)
                    .fixedSize()
                }
            }
            
            Toggle(isOn: $data.onlyFollowing) {
                Text("Only Following")
            }
        }
    }
    
    @ViewBuilder
    private func dateSection() -> some View {
        Section("Date") {
            DateEditCellView(title: "Since", date: $data.createdSince)
            DateEditCellView(title: "Until", date: $data.createdUntil)
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
