//
//  DetailEditView.swift
//  SearchBoyAdvance
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct DetailEditView: View {

    @Binding var data: TwitterOption.Data

    var body: some View {
        Form {
            titleSection()
            WordsEditSection(title: "Words".localize, words: $data.words, newWordPlaceholder: "New Word".localize)
            WordsEditSection(title: "Excluding Words".localize, words: $data.excludingWords, newWordPlaceholder: "New Word".localize)
            HashtagsEditSection(title: "Hashtags".localize, words: $data.hashtags, newWordPlaceholder: "New Hashtag".localize)
            filtersSection()
            engagementSection()
            sortSection()
            tweetedBySection()
            dateSection()
        }
        .buttonStyle(.plain)
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

// MARK: - @ViewBuilder Sections

extension DetailEditView {
    
    @ViewBuilder
    private func titleSection() -> some View {
        Section {
            TextField("Title".localize, text: $data.title)
                .font(.body.bold())
        } header: {
            Text("Title".localize)
        }
    }
    
    @ViewBuilder
    private func filtersSection() -> some View {
        Section("Filters") {

            Picker(selection: $data.mediaType, label: Text("Media")) {
                ForEach(TwitterOption.MediaType.allCases) { mediaType in
                    Text(mediaType.name.localize)
                }
            }
            
            Picker(selection: $data.language, label: Text("Language")) {
                ForEach(TwitterOption.Language.allCases) { language in
                    Text(language.name.localize)
                }
            }
            
            Toggle(isOn: $data.isSafeSearch) {
                Text("Safe Search")
            }
        }
    }
    
    @ViewBuilder
    private func engagementSection() -> some View {
        Section("Engagements") {
            EngagementsEditCellView(value: $data.minFavorites,
                                    suffixLabelText: "favorites".localize,
                                    sliderTextForVoiceOver: "Minimum favorites")
            EngagementsEditCellView(value: $data.minRetweets,
                                    suffixLabelText: "retweets".localize,
                                    sliderTextForVoiceOver: "Minimum retweets")
        }
    }
    
    @ViewBuilder
    private func sortSection() -> some View {
        HStack {
            Text("Sort")
                .padding(.trailing, 4)
            Picker(selection: $data.sortedType, label: Text("Sorted")) {
                ForEach(TwitterOption.SortedType.allCases) { sortedType in
                    Text(sortedType.name.localize).tag(sortedType)
                }
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
                    TextField(text: $data.user) {
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
            DateEditCellView(title: "Since".localize, date: $data.createdSince)
            DateEditCellView(title: "Until".localize, date: $data.createdUntil)
            Picker(selection: $data.timeZone, label: Text("TimeZone")) {
                ForEach(TwitterOption.TimeZone.allCases) { timeZone in
                    Text(timeZone.name.localize)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["ja", "en"], id: \.self) { id in
            DetailEditView(data: .constant(TwitterOption.sampleData[1].data))
                .environment(\.locale, .init(identifier: id))
        }
    }
}
