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
        var name: String = ""
        var type: TwitterOption.TweetType = .live
        var words: [String] = []
        var excludingWords: [String] = []
        var hashtags: [String] = []
        var includingImages = false
        var includingVideos = false
        var minFavorites: Int = 0
        var minRetweets: Int = 0
        var createdSince: Date?
        var createdUntil: Date?
    }

    /// QiitaOption -> QiitaOption.Data
    var data: Data {
        Data(name: name,
             type: type,
             words: words,
             excludingWords: excludingWords,
             hashtags: hashtags,
             includingImages: includingImages,
             includingVideos: includingVideos,
             minFavorites: minFavorites,
             minRetweets: minRetweets,
             createdSince: createdSince,
             createdUntil: createdUntil)
    }

    /// QiitaOption.Data -> QiitaOption
    init(data: Data) {
        self.init(name: data.name,
                  type: data.type,
                  words: data.words,
                  excludingWords: data.excludingWords,
                  hashtags: data.hashtags,
                  includingImages: data.includingImages, includingVideos: data.includingVideos,
                  minFavorites: data.minFavorites, maxRetweets: data.minRetweets,
                  createdSince: data.createdSince, createdUntil: data.createdUntil)
    }

    mutating func update(from data: Data) {
        self.name = data.name
        self.type = data.type
        self.words = data.words
        self.excludingWords = data.excludingWords
        self.hashtags = data.hashtags
        self.includingImages = data.includingImages
        self.includingVideos = data.includingVideos
        self.minFavorites = data.minFavorites
        self.minRetweets = data.minRetweets
        self.createdSince = data.createdSince
        self.createdUntil = data.createdUntil
    }
}
