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
            searchTitleSection()
            WordsEditSection(title: "Words", words: $data.words, newWordPlaceholder: "New Word")
            WordsEditSection(title: "Excluded words", words: $data.excludingWords, newWordPlaceholder: "New Word")
            HashtagsEditSection(title: "Hashtags", words: $data.hashtags, newWordPlaceholder: "New Hashtag")
            mediaSection()
            orderSection()
            engagementSection()
            dateSection()
        }
        .buttonStyle(.plain)
    }
}

// MARK: - @ViewBuilder Sections

extension DetailEditView {
    
    @ViewBuilder
    private func searchTitleSection() -> some View {
        Section("Title") {
            TextField("Title", text: $data.title)
                .font(.headline)
        }
    }
    
    @ViewBuilder
    private func mediaSection() -> some View {
        Section("Medias") {
            Picker(selection: $data.mediaType, label: Text("Type")) {
                ForEach(TwitterOption.MediaType.allCases) { mediaType in
                    Text(mediaType.displayTitle)
                }
            }
        }
    }
    
    @ViewBuilder
    private func orderSection() -> some View {
        Section("Order") {
            Picker(selection: $data.type, label: Text("Type")) {
                Text(TwitterOption.TweetType.featured.displayTitle).tag(TwitterOption.TweetType.featured)
                Text(TwitterOption.TweetType.live.displayTitle).tag(TwitterOption.TweetType.live)
            }
            .pickerStyle(SegmentedPickerStyle())
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

    @ViewBuilder
    private func dateSection() -> some View {
        Section("Date") {
            DateEditCellView(title: "Since", date: $data.createdSince)
            DateEditCellView(title: "Until", date: $data.createdUntil)
        }
    }

}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(TwitterOption.sampleData[0].data))
    }
}
