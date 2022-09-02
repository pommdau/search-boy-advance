//
//  TwitterOption.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/27.
//

import Foundation

struct TwitterOption: Identifiable, Codable, Equatable {

    // MARK: - Definition

    enum TweetType: String, Codable, CaseIterable, Identifiable {
        case featured // 話題のツイート
        case live  // 最新
        
        var id: Self { self }

        var name: String {
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
    
    enum MediaType: String, Codable, CaseIterable, Identifiable {
        case none
        case images
        case videos
        case gifs
        
        var id: Self { self }

        var name: String {
            switch self {
            case .none:
                return "Not specified"
            case .images:
                return "Image"
            case .videos:
                return "Video"
            case .gifs:
                return "GIF"
            }
        }

        var queryValue: String? {
            switch self {
            case .none:
                return nil
            case .images:
                return "filter:images"
            case .videos:
                return "filter:videos"
            case .gifs:
                return "card_name:animated_gif"
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
    var mediaType: MediaType
    var minFavorites: Int
    var minRetweets: Int
    var createdSince: Date?
    var createdUntil: Date?

    // MARK: - LifeCycle
    init(id: UUID = UUID(),
         title: String = "",
         type: TweetType = .live,
         words: [String] = [],
         excludingWords: [String] = [],
         hashtags: [String] = [],
         mediaType: MediaType = .none,
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
        self.mediaType = mediaType
        self.minFavorites = minFavorites
        self.minRetweets = maxRetweets
        self.createdSince = createdSince
        self.createdUntil = createdUntil
    }

}

// MARK: - URL

extension TwitterOption {
    
    var wordsQueryValue: String? {
        var wordsValue = ""
        for word in words {
            if !wordsValue.isEmpty {
                wordsValue += " "
            }
            
            if word.containsWhitespace {
                wordsValue += "\"\(word)\""
            } else {
                wordsValue += word
            }
        }
        
        return wordsValue.isEmpty ? nil : wordsValue
    }
    
    var excludingWordsQueryValue: String? {
        var excludingWordsValue = ""
        for excludingWord in excludingWords {
            if !excludingWordsValue.isEmpty {
                excludingWordsValue += " "
            }
            
            if excludingWord.containsWhitespace {
                excludingWordsValue += "-\"\(excludingWord)\""
            } else {
                excludingWordsValue += "-\(excludingWord)"
            }
        }
        
        return excludingWordsValue.isEmpty ? nil : excludingWordsValue
    }
    
    var hashTagsQueryValue: String? {
        var hashtagsValue = ""
        for hashtag in hashtags {
            if !hashtagsValue.isEmpty {
                hashtagsValue += " "
            }
            hashtagsValue += "#\(hashtag)"
        }
        
        return hashtagsValue.isEmpty ? nil : hashtagsValue
    }
    
    var createdMinFavoritesQueryValue: String? {
        guard minFavorites > 0 else {
            return nil
        }
        return "min_faves:\(minFavorites)"
    }
    
    var createdMinRetweetsQueryValue: String? {
        guard minRetweets > 0 else {
            return nil
        }
        return "min_retweets:\(minRetweets)"
    }
    
    var createdSinceQueryValue: String? {
        guard let createdSince = createdSince else {
            return nil
        }
        return "since:\(createdSince.toString())"
    }
    
    var createdUntilQueryValue: String? {
        guard let createdUntil = createdUntil else {
            return nil
        }
        return "until:\(createdUntil.toString())"
    }
        
    var queryItems: [URLQueryItem] {
        
        var qQueryList: [String] = []
        if let wordsQueryValue = wordsQueryValue,
           !wordsQueryValue.isEmpty {
            qQueryList.append(wordsQueryValue)
        }
        
        if let excludingWordsQueryValue = excludingWordsQueryValue {
            qQueryList.append(excludingWordsQueryValue)
        }
        
        if let hashTagsQueryValue = hashTagsQueryValue {
            qQueryList.append(hashTagsQueryValue)
        }
                
        if let createdMinFavoritesQueryValue = createdMinFavoritesQueryValue {
            qQueryList.append(createdMinFavoritesQueryValue)
        }
        
        if let createdMinRetweetsQueryValue = createdMinRetweetsQueryValue {
            qQueryList.append(createdMinRetweetsQueryValue)
        }
        
        if let createdSinceQueryValue = createdSinceQueryValue {
            qQueryList.append(createdSinceQueryValue)
        }
        
        if let createdUntilQueryValue = createdUntilQueryValue {
            qQueryList.append(createdUntilQueryValue)
        }
        
        qQueryList = qQueryList.compactMap { $0 }
        
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "q", value: qQueryList.joined(separator: " ")))
        if let typeQueryValue = type.queryValue {
            queryItems.append(URLQueryItem(name: "f", value: typeQueryValue))
        }

        return queryItems
    }

    var url: URL? {
        // baseURL
        guard let url = URL(string: "https://twitter.com/search") else {
            return nil
        }
        return url.queryItemsAdded(queryItems)
    }
}

// MARK: - Helpers

extension TwitterOption {
        
    // UUIDだけ異なるオブジェクトを返す
    var copy: TwitterOption {
        .init(data: self.data)
    }
    
    var hashtagsString: String {
        String(
            hashtags
                .reduce(into: "") { $0 += "#\($1)\n" }
                .dropLast()
        )
    }
}

// extension Array where Element == String {
//    // prefixの例: "title"
//    func createQueryValue(prefix: String) -> String {
//        self.reduce(into: "") { $0 += "+\(prefix):\($1)" }
//    }
// }
