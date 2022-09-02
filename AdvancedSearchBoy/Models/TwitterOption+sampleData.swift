//
//  TwitterOption+sampleData.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/27.
//

import Foundation

extension TwitterOption {

    static let sampleData: [TwitterOption] = [
        TwitterOption(title: "Title1",
                      sortedType: .live,
                      words: [Word(value: "word1"), Word(value: "wordA")], excludingWords: [Word(value: "excludingWords1"), Word(value: "excludingWordsA")],
                      hashtags: [Word(value: "hashtags1"), Word(value: "hashtagsA")],
                      mediaType: .images,
                      minFavorites: 10, maxRetweets: 20,
                      createdSince: Date(), createdUntil: Date()),
        TwitterOption(title: "Title2",
                      sortedType: .live,
                      words: [Word(value: "word1"), Word(value: "wordA")], excludingWords: [Word(value: "excludingWords1"), Word(value: "excludingWordsA")],
                      hashtags: [Word(value: "hashtags1"), Word(value: "hashtagsA")],
                      mediaType: .none,
                      minFavorites: 0, maxRetweets: 0,
                      createdSince: Date(), createdUntil: Date())
    ]
    
    static let recommendedData: [TwitterOption] = [        
        TwitterOption(title: "ネコ",
                      sortedType: .featured,
                      words: [Word(value: "ネコ"), Word(value: "かわいい")],
                      excludingWords: [Word(value: "犬")],
                      mediaType: .images,
                      minFavorites: 100, maxRetweets: 100)
    ]
}
