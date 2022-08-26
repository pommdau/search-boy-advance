//
//  QiitaOption+Data.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/26.
//

import Foundation

extension QiitaOption {
    struct Data {

        var name: String = ""

        var titles: [String] = []
        var excludingTitles: [String] = []

        var bodies: [String] = []
        var excludingBodies: [String] = []

        var codes: [String] = []
        var excludingCodes: [String] = []

        var tags: [String] = []
        var excludingTags: [String] = []

        var users: [String] = []
        var excludingUsers: [String] = []

        var minStocks: Int?
        var maxStocks: Int?

        var createdAt: Date?
        var updatedAt: Date?

        var words: [String] = []
        var excludingWords: [String] = []

        var sort: Sort = .rel
    }

    var data: Data {
        Data(name: name,
             titles: titles,
             excludingTitles: excludingTitles,
             bodies: bodies,
             excludingBodies: excludingBodies,
             codes: codes,
             excludingCodes: excludingCodes,
             tags: tags,
             excludingTags: excludingTags,
             users: users,
             excludingUsers: excludingUsers,
             minStocks: minStocks,
             maxStocks: maxStocks,
             createdAt: createdAt,
             updatedAt: updatedAt,
             words: words,
             excludingWords: excludingWords,
             sort: sort)
    }
}
