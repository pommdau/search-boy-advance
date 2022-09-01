//
//  HashtagsEditSection.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/09/01.
//

import SwiftUI

struct HashtagsEditSection: View {
    
    let title: String
    @Binding var words: [String]
    let newWordPlaceholder: String
    @State private var newWord = ""
    
    var body: some View {
        Section(title) {
            ForEach(words, id: \.self) { word in
                Text("# \(word)")
                    .foregroundColor(.twitterBlue)
            }
            .onDelete { indices in
                words.remove(atOffsets: indices)
            }

            HStack {
                Text("#")
                    .foregroundColor(.twitterBlue)
                    .padding(.trailing, -2)
                
                TextField(newWordPlaceholder, text: $newWord)
                    .foregroundColor(.twitterBlue)
                Button {
                    withAnimation {
                        words.append(newWord)
                        newWord = ""
                    }
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                .disabled(newWord.isEmpty)
            }
        }
    }
}

struct HashtagsEditSection_Previews: PreviewProvider {
    static var previews: some View {
        List {
            HashtagsEditSection(title: "Title",
                                words: .constant(["word1", "word2"]),
                                newWordPlaceholder: "New Hashtag")
        }
    }
}
