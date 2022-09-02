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
                      type: .live,
                      words: ["word1", "wordA"], excludingWords: ["excludingWords1", "excludingWordsA"],
                      hashtags: ["hashtags1", "hashtagsA"],
                      includingImages: true, includingVideos: false,
                      minFavorites: 10, maxRetweets: 20,
                      createdSince: Date(), createdUntil: Date()),
        TwitterOption(title: "Title2",
                      type: .live,
                      words: ["word1", "wordA"], excludingWords: ["excludingWords1", "excludingWordsA"],
                      hashtags: ["hashtags1", "hashtagsA"],
                      includingImages: false, includingVideos: false,
                      minFavorites: 0, maxRetweets: 0,
                      createdSince: Date(), createdUntil: Date())
    ]
    
    static let recommendedData: [TwitterOption] = [        
        TwitterOption(title: "ネコ",
                      type: .featured,
                      words: ["ネコ", "かわいい"],
                      excludingWords: ["犬"],
                      includingImages: true,
                      minFavorites: 100, maxRetweets: 100)
    ]
}
