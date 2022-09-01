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
        var type: TwitterOption.TweetType = .live
        var words: [String] = []
        var excludingWords: [String] = []
        var hashtags: [String] = []
        var includingImages = false
        var includingVideos = false
        var minFavorites: Double = 0
        var minRetweets: Double = 0
        var createdSince: Date?
        var createdUntil: Date?
    }

    /// QiitaOption -> QiitaOption.Data
    var data: Data {
        Data(title: title,
             type: type,
             words: words,
             excludingWords: excludingWords,
             hashtags: hashtags,
             includingImages: includingImages,
             includingVideos: includingVideos,
             minFavorites: Double(minFavorites),
             minRetweets: Double(minRetweets),
             createdSince: createdSince,
             createdUntil: createdUntil)
    }

    /// QiitaOption.Data -> QiitaOption
    init(data: Data) {
        self.init(title: data.title,
                  type: data.type,
                  words: data.words,
                  excludingWords: data.excludingWords,
                  hashtags: data.hashtags,
                  includingImages: data.includingImages, includingVideos: data.includingVideos,
                  minFavorites: Int(data.minFavorites), maxRetweets: Int(data.minRetweets),
                  createdSince: data.createdSince, createdUntil: data.createdUntil)
    }

    mutating func update(from data: Data) {
        self.title = data.title
        self.type = data.type
        self.words = data.words
        self.excludingWords = data.excludingWords
        self.hashtags = data.hashtags
        self.includingImages = data.includingImages
        self.includingVideos = data.includingVideos
        self.minFavorites = Int(data.minFavorites)
        self.minRetweets = Int(data.minRetweets)
        self.createdSince = data.createdSince
        self.createdUntil = data.createdUntil
    }
}
