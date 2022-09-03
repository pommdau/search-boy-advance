//
//  WordsEditSection.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/09/01.
//

import SwiftUI

struct WordsEditSection: View {
    
    let title: String
    @Binding var words: [Word]
    let newWordPlaceholder: String
    @State private var newWord = Word(value: "")
    
    var body: some View {
        Section(title) {
            ForEach($words) { $word in
                TextField("", text: $word.value)
            }
            .onDelete { indices in
                words.remove(atOffsets: indices)
            }

            HStack {
                TextField("New Word", text: $newWord.value)
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
}

struct WordsEditCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            WordsEditSection(title: "Title",
                             words: .constant([Word(value: "word2"), Word(value: "word4")]),
                             newWordPlaceholder: "New words")
        }
    }
}
