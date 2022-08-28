//
//  DetailEditView.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import SwiftUI

struct DetailEditView: View {

    @Binding var data: TwitterOption.Data
    @State private var newWord = ""
    @State private var newHashtag = ""

    var body: some View {

        Form {
            Section("Words") {

                ForEach(data.words, id: \.self) { word in
                    Text(word)
                }
                .onDelete { indices in
                    data.words.remove(atOffsets: indices)
                }

                HStack {
                    TextField("New Word", text: $newWord)
                    Button {
                        withAnimation {
                            data.words.append(newWord)
                            newWord = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newWord.isEmpty)
                }
            }

            Section("Hashtags") {

                ForEach(data.hashtags, id: \.self) { hashtag in
                    Text("# \(hashtag)")
                        .foregroundColor(.twitterBlue)
                }
                .onDelete { indices in
                    data.hashtags.remove(atOffsets: indices)
                }

                HStack {
                    Text("#")
                        .foregroundColor(.twitterBlue)
                        .padding(.trailing, -2)
                    TextField("New Hashtag", text: $newHashtag)
                        .foregroundColor(.twitterBlue)
                    Button {
                        withAnimation {
                            data.hashtags.append(newHashtag)
                            newHashtag = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newHashtag.isEmpty)
                }
            }

            //                if !option.words.isEmpty {
            //                    DetailCellView(title: "Words",
            //                                   text: option.words.joined(separator: "\n"))
            //                }
            //
            //                if !option.hashtags.isEmpty {
            //                    DetailCellView(title: "Hashtags",
            //                                   text: option.hashtagsString,
            //                                   rightTextColor: .twitterBlue)
            //                }
            //
            //                if !option.excludingWords.isEmpty {
            //                    DetailCellView(title: "Excluded words",
            //                                   text: option.excludingWords.joined(separator: "\n"))
            //                }

            //            if !option.filtersString.isEmpty {
            //                Section("Filters") {
            //                    DetailCellView(title: "Including",
            //                                   text: option.filtersString)
            //                }
            //            }
            //
            //            if option.minFavorites > 0 || option.minRetweets > 0 {
            //                Section("Engagements") {
            //                    if option.minFavorites > 0 {
            //                        DetailCellView(title: "Minimum favorites",
            //                                       text: String(option.minFavorites))
            //                    }
            //
            //                    if option.minRetweets > 0 {
            //                        DetailCellView(title: "Minimum retweets",
            //                                       text: String(option.minRetweets))
            //                    }
            //                }
            //            }
            //
            //            if option.createdSince != nil || option.createdUntil != nil {
            //                Section("Dates") {
            //                    if let createdSince = option.createdSince {
            //                        DetailCellView(title: "Since",
            //                                       text: createdSince.toString())
            //                    }
            //
            //                    if let createdUntil = option.createdUntil {
            //                        DetailCellView(title: "Until",
            //                                       text: createdUntil.toString())
            //                    }
            //                }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(TwitterOption.sampleData[0].data))
    }
}
