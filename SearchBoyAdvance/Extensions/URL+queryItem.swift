//
//  URL+queryItem.swift
//  SearchBoyAdvance
//
//  Created by HIROKI IKEUCHI on 2022/08/25.
//  ref: [Swift で URL のクエリストリングを簡単に追加したい](https://qiita.com/KosukeOhmura/items/8b65bdb63da6df95c7a3)

import Foundation

extension URL {

    // クエリを一つ追加した新しいURLを返す
    func queryItemAdded(name: String, value: String?) -> URL? {
        self.queryItemsAdded([URLQueryItem(name: name, value: value)])
    }

    // クエリを複数追加した新しいURLを返す
    func queryItemsAdded(_ queryItems: [URLQueryItem]) -> URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: self.baseURL != nil) else {
            return nil
        }
        components.queryItems = queryItems + (components.queryItems ?? [])
        return components.url
    }

}
