//
//  HashtagsEditSection.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/09/01.
//

import SwiftUI

struct HashtagsEditSection: View {
    
    let title: String
    @Binding var words: [Word]
    let newWordPlaceholder: String
    @State private var newWord = Word(value: "")
    
    var body: some View {
        Section(title) {
            currentWordCells()
            newWordCell()
        }
    }
    
    @ViewBuilder
    private func currentWordCells() -> some View {
        ForEach($words) { $word in
            HStack {
                Text("#")
                    .padding(.trailing, -2)
                TextField("", text: $word.value)
            }
            .foregroundColor(.twitterBlue)
        }
        .onDelete { indices in
            words.remove(atOffsets: indices)
        }
    }
    
    @ViewBuilder
    private func newWordCell() -> some View {
        HStack {
            Text("#")
                .foregroundColor(.twitterBlue)
                .padding(.trailing, -2)
            TextField(newWordPlaceholder, text: $newWord.value)
                .foregroundColor(.twitterBlue)
            Button {
                withAnimation {
                    words.append(newWord)
                    newWord = Word(value: "")
                }
            } label: {
                Image(systemName: "plus.circle.fill")
            }
            .disabled(newWord.value.isEmpty)
        }
    }
}

struct HashtagsEditSection_Previews: PreviewProvider {
    static var previews: some View {
        List {
            HashtagsEditSection(title: "Hashtags".localize,
                                words: .constant([Word(value: "word1"), Word(value: "word2")]),
                                newWordPlaceholder: "New Hashtag".localize)
        }
    }
}
