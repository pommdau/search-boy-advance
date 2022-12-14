//
//  TwitterOption+sampleData.swift
//  SearchBoyAdvance
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
                      minFavorites: 0, minRetweets: 0,
                      sortedType: .featured,
                      user: "",
                      onlyFollowing: false,
                      createdSince: nil, createdUntil: nil),
        
        // 全オプション設定済み
        TwitterOption(title: "Title2",
                      words: [Word(value: "ネコ")], excludingWords: [Word(value: "犬")],
                      hashtags: [Word(value: "かわいい")],
                      mediaType: .images,
                      language: .japanese,
                      isSafeSearch: true,
                      minFavorites: 10, minRetweets: 20,
                      sortedType: .featured,
                      user: "ikeh1024",
                      onlyFollowing: true,
                      createdSince: Date.twitterStartedAt, createdUntil: Date(),
                      timeZone: .jst),
                
        TwitterOption(title: "(Sample) From @Twitter",
                      words: [Word(value: "Happy"), Word(value: "you")],
                      excludingWords: [Word(value: "unhappy")],
                      hashtags: [Word(value: "Lovetwitter")],
                      mediaType: .images,
                      language: .none,
                      isSafeSearch: true,
                      minFavorites: 10, minRetweets: 15,
                      sortedType: .featured,
                      user: "Twitter",
                      onlyFollowing: false,
                      createdSince: nil, createdUntil: nil)
    ]
    
    static let recommendedData: [TwitterOption] = [
        TwitterOption(title: "Pretty cat images",
                      words: [Word(value: "pretty")],
                      excludingWords: [],
                      hashtags: [Word(value: "cat")],
                      mediaType: .images,
                      language: .none,
                      isSafeSearch: false,
                      minFavorites: 100, minRetweets: 0,
                      sortedType: .featured,
                      user: "",
                      onlyFollowing: false,
                      createdSince: nil, createdUntil: nil)
    ]
    
    static let screenshotData: [TwitterOption] = [
        TwitterOption(title: "Pretty cat images".localize,
                      words: [Word(value: "pretty".localize), Word(value: "cat".localize)],
                      excludingWords: [],
                      hashtags: [],
                      mediaType: .images,
                      language: .none,
                      isSafeSearch: false,
                      minFavorites: 50, minRetweets: 0,
                      sortedType: .featured,
                      user: "",
                      onlyFollowing: false,
                      createdSince: nil, createdUntil: nil),
        
        TwitterOption(title: "Pretty frog images".localize,
                      words: [Word(value: "pretty".localize), Word(value: "frog".localize)],
                      excludingWords: [],
                      hashtags: [],
                      mediaType: .images,
                      language: .none,
                      isSafeSearch: false,
                      minFavorites: 50, minRetweets: 0,
                      sortedType: .featured,
                      user: "",
                      onlyFollowing: false,
                      createdSince: nil, createdUntil: nil),
        
        TwitterOption(title: "Pretty horse images".localize,
                      words: [Word(value: "pretty".localize), Word(value: "horse".localize)],
                      excludingWords: [],
                      hashtags: [],
                      mediaType: .images,
                      language: .none,
                      isSafeSearch: false,
                      minFavorites: 50, minRetweets: 0,
                      sortedType: .featured,
                      user: "",
                      onlyFollowing: false,
                      createdSince: nil, createdUntil: nil)
    ]
}
