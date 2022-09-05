//
//  Query.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/09/05.
//

import Foundation

struct Query {
    
    let option: TwitterOption
    
    var queryItems: [URLQueryItem] {
        // 検索(q)クエリ
        let qValues = [
            words,
            excludingWords,
            hashtags,
            mediaType,
            language,
            isSafeSearch,
            minFavorites,
            minRetweets,
            user,
            onlyFollowing,
            createdSince,
            createdUntil
        ].compactMap { $0 }
        var queryItems = [URLQueryItem(name: "q", value: qValues.joined(separator: " "))]
        
        // 表示順
        switch option.sortedType {
        case .featured:
            break
        case .live:
            queryItems.append(URLQueryItem(name: "f", value: "live"))
        }
        
        return queryItems
    }
    
    private var words: String? {
        var value = ""
        for word in option.words {
            if !value.isEmpty {
                value += " "
            }
            if word.value.containsWhitespace {
                value += "\"\(word)\""
            } else {
                value += word.value
            }
        }
        
        return value.isEmpty ? nil : value
    }
    
    private var excludingWords: String? {
        var value = ""
        for excludingWord in option.excludingWords {
            if !value.isEmpty {
                value += " "
            }
            
            if excludingWord.value.containsWhitespace {
                value += "-\"\(excludingWord)\""
            } else {
                value += "-\(excludingWord)"
            }
        }
        
        return value.isEmpty ? nil : value
    }
    
    private var hashtags: String? {
        var value = ""
        for hashtag in option.hashtags {
            if !value.isEmpty {
                value += " "
            }
            value += "#\(hashtag)"
        }
        
        return value.isEmpty ? nil : value
    }
    
    private var mediaType: String? {
        var value = ""
        
        switch option.mediaType {
        case .none:
            return nil
        case .images:
            if !value.isEmpty {
                value += " "
            }
            value += "filter:images"
        case .videos:
            if !value.isEmpty {
                value += " "
            }
            value += "filter:videos"
        case .gifs:
            if !value.isEmpty {
                value += " "
            }
            value += "card_name:animated_gif"
        }
        return value.isEmpty ? nil : value
    }
    
    private var language: String? {
        switch option.language {
        case .none:
            return nil
        default:
            return "lang:\(option.language.rawValue)"
        }
    }
    
    private var isSafeSearch: String? {
        option.isSafeSearch ? "filter:safe" : nil
    }
    
    private var minFavorites: String? {
        guard option.minFavorites > 0 else {
            return nil
        }
        return "min_faves:\(option.minFavorites)"
    }
    
    private var minRetweets: String? {
        guard option.minRetweets > 0 else {
            return nil
        }
        return "min_retweets:\(option.minRetweets)"
    }
        
    private var user: String? {
        guard !option.user.isEmpty else {
            return nil
        }
        return "user:@\(option.user)"
    }
    
    private var onlyFollowing: String? {
        option.onlyFollowing ? "filter:follows" : nil
    }
    
    private var createdSince: String? {
        guard let createdSince = option.createdSince else {
            return nil
        }
        return "since:\(createdSince.toString())"
    }
    
    private var createdUntil: String? {
        guard let createdUntil = option.createdUntil else {
            return nil
        }
        return "until:\(createdUntil.toString())"
    }
}
