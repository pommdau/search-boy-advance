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
                      words: [Word(value: "twitter")], excludingWords: [Word(value: "facebook")],
                      hashtags: [Word(value: "Twitter")],
                      mediaType: .none,
                      language: .none,
                      isSafeSearch: false,
                      minFavorites: 0, maxRetweets: 0,
                      sortedType: .featured,
                      user: nil,
                      onlyFollowing: false,
                      createdSince: nil, createdUntil: nil),
        
        TwitterOption(title: "Title2",
                      words: [Word(value: "ネコ")], excludingWords: [Word(value: "犬")],
                      hashtags: [Word(value: "かわいい")],
                      mediaType: .images,
                      language: .japanese,
                      isSafeSearch: true,
                      minFavorites: 10, maxRetweets: 20,
                      sortedType: .featured,
                      user: nil,
                      onlyFollowing: false,
                      createdSince: Date.twitterStartedAt, createdUntil: Date())
    ]
    
    static let recommendedData: [TwitterOption] = [
        TwitterOption(title: "Title1",
                      words: [Word(value: "twitter")], excludingWords: [Word(value: "facebook")],
                      hashtags: [Word(value: "")],
                      mediaType: .none,
                      language: .none,
                      isSafeSearch: false,
                      minFavorites: 0, maxRetweets: 0,
                      sortedType: .featured, user: nil,
                      onlyFollowing: false,
                      createdSince: nil, createdUntil: nil)
    ]
}
