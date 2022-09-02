//
//  QiitaOptions+sampleData.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//

import Foundation

extension QiitaOption {

    static let sampleData: [QiitaOption] = [
        QiitaOption(name: "name1",
                    titles: ["macOS", "アプリ"],
                    words: ["Swift"],
                    sort: .like),

        QiitaOption(name: "Name2",
                    titles: ["title1", "title2"], excludingTitles: ["titleA", "titleB"],
                    bodies: ["body1"], excludingBodies: ["bodyA"],
                    codes: ["code1"], excludingCodes: ["codeA"],
                    tags: ["tag1"], excludingTags: ["tagA"],
                    users: ["user1"], excludingUsers: ["userA"],
                    minStocks: 10, maxStocks: 100,
                    createdAt: nil, updatedAt: nil,
                    words: ["word1"], includingWords: ["wordA"],
                    sort: .rel)
    ]

}
