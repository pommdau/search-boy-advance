//
//  QiitaOptions.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//
//  ref: https://help.qiita.com/ja/articles/qiita-search-options

import Foundation

struct QiitaOptions: Identifiable, Codable {
    
    // MARK: - Definition
    
    enum Sort: Codable {
        case created  // 新着順
        case rel  // 関連順
        case stock  // ストック数
        case like  // いいね数順
        
        var displayTitle: String {
            switch self {
            case .created:
                return "新着順"
            case .rel:
                return "関連順"
            case .stock:
                return "ストック数"
            case .like:
                return "いいね数順"
            }
        }
    }
    
    // MARK: - Properties
    
    // MARK: Private Properties
        
    let id: UUID
    
    var titles: [String]
    var excludingTitles: [String]
    
    var bodies: [String]
    var excludingBodies: [String]
    
    var codes: [String]
    var excludingCodes: [String]
    
    var tags: [String]
    var excludingTags: [String]
    
    var users: [String]
    var excludingUsers: [String]

    var minStocks: Int?
    var maxStocks: Int?  // stocks:>=n が使える
    
    var createdAt: Date?
    var updatedAt: Date?
    
    var words: [String]
    var includingWords: [String]
    
    let sort: Sort

    // MARK: Computed Properties
    
    var queryItems: [URLQueryItem] {
        
//        let titleQueryString = titles.reduce("", { (first, second) -> String in
//            "\(first)+\(second)"
//        })
//        let titlesQuery = URLQueryItem(name: "q", value: titleQueryString)
//
//        return [titlesQuery]
        
        return [URLQueryItem(name: "q", value: titles.createQueryValue(prefix: "title"))]
    }
        
    var url: URL? {
        let url = URL(string: "https://qiita.com/search")!  // baseURL
        print(url.queryItemsAdded(queryItems)?.standardizedFileURL)
        return url.queryItemsAdded(queryItems)
    }
    
    // MARK: - LifeCycle
    
    init(id: UUID = UUID(),
         titles: [String] = [],
         excludingTitles: [String] = [],
         bodies: [String] = [],
         excludingBodies: [String] = [],
         codes: [String] = [],
         excludingCodes: [String] = [],
         tags: [String] = [],
         excludingTags: [String] = [],
         users: [String] = [],
         excludingUsers: [String] = [],
         minStocks: Int? = nil,
         maxStocks: Int? = nil,
         createdAt: Date? = nil,
         updatedAt: Date? = nil,
         words: [String] = [],
         includingWords: [String] = [],
         sort: Sort = .like
    ) {
        self.id = id
        self.titles = titles
        self.excludingTitles = excludingTitles
        self.bodies = bodies
        self.excludingBodies = excludingBodies
        self.codes = codes
        self.excludingCodes = excludingCodes
        self.tags = tags
        self.excludingTags = excludingTags
        self.users = users
        self.excludingUsers = excludingUsers
        self.minStocks = minStocks
        self.maxStocks = maxStocks
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.words = words
        self.includingWords = includingWords
        self.sort = sort
    }
    
}

extension Array where Element == String {
    // prefixの例: "title"
    func createQueryValue(prefix: String) -> String {
        return self.reduce("", { (first, second) -> String in
            "\(first)+\(prefix):\(second)"
        })
    }
}
