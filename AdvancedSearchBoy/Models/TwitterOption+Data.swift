//
//  TwitterOption+Data.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/28.
//

import Foundation

extension TwitterOption {

    /// TwitterOptionの作成/編集時の受け渡し用のデータクラス
    struct Data {
        var title: String = ""
        var words: [Word] = []
        var excludingWords: [Word] = []
        var hashtags: [Word] = []
        var mediaType: MediaType = .none
        var language: Language = .none
        var isSafeSearch = false
        var minFavorites: Double = 0
        var minRetweets: Double = 0
        var sortedType: TwitterOption.SortedType = .live
        var user: String? = nil
        var onlyFollowing = false
        var createdSince: Date?
        var createdUntil: Date?
    }

    /// QiitaOption -> QiitaOption.Data
    var data: Data {
        Data(title: title,
             words: words,
             excludingWords: excludingWords,
             hashtags: hashtags,
             mediaType: mediaType,
             language: language,
             isSafeSearch: isSafeSearch,
             minFavorites: Double(minFavorites),
             minRetweets: Double(minRetweets),
             sortedType: sortedType,
             user: user,
             onlyFollowing: onlyFollowing,
             createdSince: createdSince,
             createdUntil: createdUntil)
    }

    /// QiitaOption.Data -> QiitaOption
    init(data: Data) {
        self.init(title: data.title,
                  words: data.words,
                  excludingWords: data.excludingWords,
                  hashtags: data.hashtags,
                  mediaType: data.mediaType,
                  language: data.language,
                  isSafeSearch: data.isSafeSearch,
                  minFavorites: Int(data.minFavorites),
                  maxRetweets: Int(data.minRetweets),
                  sortedType: data.sortedType,
                  user: data.user,
                  onlyFollowing: data.onlyFollowing,
                  createdSince: data.createdSince,
                  createdUntil: data.createdUntil)
    }

    mutating func update(from data: Data) {
        self.title = data.title
        self.words = data.words
        self.excludingWords = data.excludingWords
        self.hashtags = data.hashtags
        self.mediaType = data.mediaType
        self.language = data.language
        self.isSafeSearch = data.isSafeSearch
        self.minFavorites = Int(data.minFavorites)
        self.minRetweets = Int(data.minRetweets)
        self.sortedType = data.sortedType
        self.user = data.user
        self.onlyFollowing = data.onlyFollowing
        self.createdSince = data.createdSince
        self.createdUntil = data.createdUntil
    }
}
