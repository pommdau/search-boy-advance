//
//  String+Extension.swift
//  SearchBoyAdvance
//
//  Created by HIROKI IKEUCHI on 2022/09/01.
//

import Foundation

extension String {
    var containsWhitespace: Bool {
        return(self.rangeOfCharacter(from: .whitespacesAndNewlines) != nil)
    }
    
    /// 頭文字は大文字、それ以外は小文字のStringを返す
    /// ref: https://dev.classmethod.jp/articles/atamamoji-uppercased/
    func initialUppercased() -> String {
        let lowercasedString = self.lowercased()
        return lowercasedString.prefix(1).uppercased() + lowercasedString.dropFirst()
    }
}
