//
//  TwitterOption.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/27.
//
//  ref: [Twitter検索オプションと高度な検索](https://www.howtonote.jp/twitter/helpful/index7.html)

import Foundation

struct TwitterOption: Identifiable, Codable {

    // MARK: - Definition

    enum TweetType: String, Codable {
        case featured // 話題のツイート
        case live  // 最新

        var displayTitle: String {
            switch self {
            case .featured:
                return "話題のツイート"
            case .live:
                return "最新"
            }
        }

        var queryValue: String? {
            switch self {
            case .featured:
                return nil
            case .live:
                return "live"
            }
        }
    }

    // MARK: - Properties

    // MARK: Private Properties

    let id: UUID
    let name: String
    let type: TweetType

    // MARK: Words

    var words: [String]
    var excludingWords: [String]
    var hashtags: [String]

    // MARK: Filters

    var includingImages: Bool
    var includingVideos: Bool

    // MARK: Engagement

    var minFavorites: Int
    var maxRetweets: Int

    // MARK: Dates

    var createdSince: Date?
    var createdUntil: Date?

    // MARK: Computed Properties

    var queryItems: [URLQueryItem] {

        var queryItems = [URLQueryItem]()

        queryItems.append(URLQueryItem(name: "q", value: words.joined(separator: " ")))
        if let typeQueryValue = type.queryValue {
            queryItems.append(URLQueryItem(name: "q", value: typeQueryValue))
        }

        return queryItems
    }

    var hashtagsString: String {
        String(
            hashtags
                .reduce(into: "") { $0 += "#\($1)\n" }
                .dropLast()
        )
    }

    var filtersString: String {
        var filtersString = ""
        filtersString += includingImages ? "Images\n" : ""
        filtersString += includingVideos ? "Videos\n" : ""
        if filtersString.isEmpty {
            return ""
        }
        return String(filtersString.dropLast())
    }

    var url: URL? {
        // baseURL
        guard let url = URL(string: "https://twitter.com/search") else {
            return nil
        }
        return url.queryItemsAdded(queryItems)
    }

    // MARK: - LifeCycle
    init(id: UUID = UUID(),
         name: String = "",
         type: TweetType = .live,
         words: [String] = [],
         excludingWords: [String] = [],
         hashtags: [String] = [],
         includingImages: Bool = false,
         includingVideos: Bool = false,
         minFavorites: Int = 0,
         maxRetweets: Int = 0,
         createdSince: Date? = nil,
         createdUntil: Date? = nil
    ) {
        self.id = id
        self.name = name
        self.type = type
        self.words = words
        self.excludingWords = excludingWords
        self.hashtags = hashtags
        self.includingImages = includingImages
        self.includingVideos = includingVideos
        self.minFavorites = minFavorites
        self.maxRetweets = maxRetweets
        self.createdSince = createdSince
        self.createdUntil = createdUntil
    }

}

// extension Array where Element == String {
//    // prefixの例: "title"
//    func createQueryValue(prefix: String) -> String {
//        self.reduce(into: "") { $0 += "+\(prefix):\($1)" }
//    }
// }
