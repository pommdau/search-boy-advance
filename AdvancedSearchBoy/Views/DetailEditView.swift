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
    @State private var newExcludedWord = ""
    @State private var newCreatedSince: Date?
    @State private var newCreatedSinceIsValid = false
    @State private var newCreatedUntil: Date?
    @State private var newCreatedUntilIsValid = false

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

            //            Section("Hashtags") {
            //
            //                ForEach(data.hashtags, id: \.self) { hashtag in
            //                    Text("# \(hashtag)")
            //                        .foregroundColor(.twitterBlue)
            //                }
            //                .onDelete { indices in
            //                    data.hashtags.remove(atOffsets: indices)
            //                }
            //
            //                HStack {
            //                    Text("#")
            //                        .foregroundColor(.twitterBlue)
            //                        .padding(.trailing, -2)
            //                    TextField("New Hashtag", text: $newHashtag)
            //                        .foregroundColor(.twitterBlue)
            //                    Button {
            //                        withAnimation {
            //                            data.hashtags.append(newHashtag)
            //                            newHashtag = ""
            //                        }
            //                    } label: {
            //                        Image(systemName: "plus.circle.fill")
            //                    }
            //                    .disabled(newHashtag.isEmpty)
            //                }
            //            }
            //
            //            Section("Excluded words") {
            //                ForEach(data.excludingWords, id: \.self) { excludingWord in
            //                    Text(excludingWord)
            //                }
            //                .onDelete { indices in
            //                    data.excludingWords.remove(atOffsets: indices)
            //                }
            //
            //                HStack {
            //                    TextField("New Word", text: $newExcludedWord)
            //                    Button {
            //                        withAnimation {
            //                            data.excludingWords.append(newExcludedWord)
            //                            newExcludedWord = ""
            //                        }
            //                    } label: {
            //                        Image(systemName: "plus.circle.fill")
            //                    }
            //                    .disabled(newExcludedWord.isEmpty)
            //                }
            //            }

            //            Section("Order") {
            //                Picker(selection: $data.type, label: Text("Type")) {
            //                    Text(TwitterOption.TweetType.featured.displayTitle).tag(TwitterOption.TweetType.featured)
            //                    Text(TwitterOption.TweetType.live.displayTitle).tag(TwitterOption.TweetType.live)
            //                }
            //                .pickerStyle(SegmentedPickerStyle())
            //            }
            //
            //            Section("Filters") {
            //                Toggle(isOn: $data.includingImages) {
            //                    Text("画像を含む")
            //                }
            //                Toggle(isOn: $data.includingVideos) {
            //                    Text("動画を含む")
            //                }
            //            }

            Section("Engagements") {
                HStack {
                    Slider(value: $data.minFavorites,
                           in: 0...1000,
                           step: 10) {
                        Text("Minimum favorites")  // For VoiceOver
                    }
                    Spacer()
                    Text("\(Int(data.minFavorites)) favorites")
                }

                HStack {
                    Slider(value: $data.minRetweets,
                           in: 0...1000,
                           step: 10) {
                        Text("Minimum retweets")  // For VoiceOver
                    }
                    Spacer()
                    Text("\(Int(data.minRetweets)) retweets")
                }
            }

            Section("Date") {
                HStack {
                    Text("Since")
                    Spacer()
                    DatePicker("",
                               selection: Binding<Date>(
                                get: { self.newCreatedSince ?? Date() },
                                set: { self.newCreatedSince = $0 }
                               ),
                               in: dateRange,
                               displayedComponents: [.date]
                    )
                    Toggle(isOn: $newCreatedSinceIsValid) { }
                        .labelsHidden()
                }

                HStack {
                    Text("Until")
                    Spacer()
                    DatePicker("",
                               selection: Binding<Date>(
                                get: { self.newCreatedUntil ?? Date() },
                                set: { self.newCreatedUntil = $0 }
                               ),
                               in: dateRange,
                               displayedComponents: [.date]
                    )
                    Toggle(isOn: $newCreatedUntilIsValid) { }
                        .labelsHidden()
                }
            }
        }
        .buttonStyle(.plain)
    }

    private let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2006, month: 7, day: 15)  // Twitterのサービス開始日時
        return (calendar.date(from: startComponents) ?? Date())
            ...
            Date()
    }()
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(TwitterOption.sampleData[0].data))
    }
}
