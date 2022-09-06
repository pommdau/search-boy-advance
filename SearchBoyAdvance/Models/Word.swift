//
//  Word.swift
//  SearchBoyAdvance
//
//  Created by HIROKI IKEUCHI on 2022/09/02.
//
//  ForEach内のTextFieldで編集するためにStringにidを持たせた型を使う

import Foundation

struct Word: Identifiable, Codable, Equatable {
    let id: UUID
    var value: String
    
    init(value: String, id: UUID = UUID()) {
        self.id = id
        self.value = value
    }
}
