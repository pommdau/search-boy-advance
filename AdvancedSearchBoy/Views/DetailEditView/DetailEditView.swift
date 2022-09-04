//
//  DetailEditView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct DetailEditView: View {

    @Binding var data: TwitterOption.Data

    var body: some View {
        Form {
            titleSection()
//            WordsEditSection(title: "Words", words: $data.words, newWordPlaceholder: "New Word")
//            WordsEditSection(title: "Excluded words", words: $data.excludingWords, newWordPlaceholder: "New Word")
//            HashtagsEditSection(title: "Hashtags", words: $data.hashtags, newWordPlaceholder: "New Hashtag")
            mediaSection()
            
            userSection()
            engagementSection()
            dateSection()
        }
        .buttonStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - @ViewBuilder Sections

extension DetailEditView {
    
    @ViewBuilder
    private func titleSection() -> some View {
        Section {
            TextField("Title", text: $data.title)
                .font(.body.bold())
        } header: {
            Text("Title")
        }
    }
    
    @ViewBuilder
    private func mediaSection() -> some View {
        Section("Medias") {

            Picker(selection: $data.mediaType, label: Text("Media")) {
                ForEach(TwitterOption.MediaType.allCases) { mediaType in
                    Text(mediaType.name)
                }
            }
            
            Text("Language")
            
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
    }
    
    @ViewBuilder
    private func userSection() -> some View {
        Section("From") {
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
            Text("Only Following")
        }
    }
    
    @ViewBuilder
    private func dateSection() -> some View {
        Section("Date") {
            DateEditCellView(title: "Since", date: $data.createdSince)
            DateEditCellView(title: "Until", date: $data.createdUntil)
        }
    }
    
    @ViewBuilder
    private func engagementSection() -> some View {
        Section("Engagements") {
            EngagementsEditCellView(value: $data.minFavorites,
                                    suffixLabelText: "favorites",
                                    sliderTextForVoiceOver: "Minimum favorites")
            EngagementsEditCellView(value: $data.minRetweets,
                                    suffixLabelText: "retweets",
                                    sliderTextForVoiceOver: "Minimum retweets")
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(TwitterOption.sampleData[0].data))
    }
}
