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
    var user: String?
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
         maxRetweets: Int = 0,  // TODO: max -> min
         sortedType: SortedType = .live,
         user: String? = nil,
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
        self.minRetweets = maxRetweets
        self.sortedType = sortedType
        self.user = user
        self.onlyFollowing = onlyFollowing
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
            
            if word.value.containsWhitespace {
                wordsValue += "\"\(word)\""
            } else {
                wordsValue += word.value
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
            
            if excludingWord.value.containsWhitespace {
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
        if let typeQueryValue = sortedType.queryValue {
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
