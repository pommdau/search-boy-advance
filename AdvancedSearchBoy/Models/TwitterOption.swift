//
//  TwitterOption.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/27.
//

import Foundation

struct TwitterOption: Identifiable, Codable, Equatable {

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

    let id: UUID
    var title: String
    var type: TweetType
    var words: [String]
    var excludingWords: [String]
    var hashtags: [String]
    var includingImages: Bool
    var includingVideos: Bool
    var minFavorites: Int
    var minRetweets: Int
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
         title: String = "",
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
        self.title = title
        self.type = type
        self.words = words
        self.excludingWords = excludingWords
        self.hashtags = hashtags
        self.includingImages = includingImages
        self.includingVideos = includingVideos
        self.minFavorites = minFavorites
        self.minRetweets = maxRetweets
        self.createdSince = createdSince
        self.createdUntil = createdUntil
    }

}

extension TwitterOption {
    
    // UUIDだけ異なるオブジェクトを返す
    var copy: TwitterOption {
        .init(data: self.data)
    }
    
}

// extension Array where Element == String {
//    // prefixの例: "title"
//    func createQueryValue(prefix: String) -> String {
//        self.reduce(into: "") { $0 += "+\(prefix):\($1)" }
//    }
// }
