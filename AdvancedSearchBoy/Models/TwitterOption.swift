//
//  TwitterOption.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/27.
//

import Foundation

struct TwitterOption: Identifiable, Codable, Equatable {

    // MARK: - Properties

    let id: UUID
    var title: String
    var words: [Word]
    var excludingWords: [Word]
    var hashtags: [Word]
    var mediaType: MediaType
    var language: Language
    var isSafeSearch: Bool
    var minFavorites: Int
    var minRetweets: Int
    var sortedType: SortedType
    var user: String
    var onlyFollowing: Bool
    var createdSince: Date?
    var createdUntil: Date?

    // MARK: - LifeCycle
    init(id: UUID = UUID(),
         title: String = "",
         words: [Word] = [],
         excludingWords: [Word] = [],
         hashtags: [Word] = [],
         mediaType: MediaType = .none,
         language: Language = .none,
         isSafeSearch: Bool = false,
         minFavorites: Int = 0,
         minRetweets: Int = 0,
         sortedType: SortedType = .live,
         user: String = "",
         onlyFollowing: Bool = false,
         createdSince: Date? = nil,
         createdUntil: Date? = nil
    ) {
        self.id = id
        self.title = title
        self.words = words
        self.excludingWords = excludingWords
        self.hashtags = hashtags
        self.mediaType = mediaType
        self.language = language
        self.isSafeSearch = isSafeSearch
        self.minFavorites = minFavorites
        self.minRetweets = minRetweets
        self.sortedType = sortedType
        self.user = user
        self.onlyFollowing = onlyFollowing
        self.createdSince = createdSince
        self.createdUntil = createdUntil
    }
}

// MARK: - Helpers

extension TwitterOption {
    
    var url: URL? {
        // baseURL
        guard let url = URL(string: "https://twitter.com/search") else {
            return nil
        }
        return url.queryItemsAdded(Query(option: self).queryItems)
    }
    
    // UUIDだけ異なるオブジェクトを返す
    var copy: TwitterOption {
        .init(data: self.data)
    }
}
