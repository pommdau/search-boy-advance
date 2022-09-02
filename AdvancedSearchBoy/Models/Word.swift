//
//  Word.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/09/02.
//
//  ForEach内のTextFieldで編集するためにStringにidを持たせた型を使う

import Foundation

struct Word: Identifiable, Codable {
    let id: UUID
    var value: String
    
    init(id: UUID = UUID(), value: String) {
        self.id = id
        self.value = value
    }
}
