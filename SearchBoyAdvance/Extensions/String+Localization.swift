//
//  String+Localization.swift
//  SearchBoyAdvance
//
//  Created by HIROKI IKEUCHI on 2022/09/06.
//

import Foundation

extension String {
    
    var localize: String {
        NSLocalizedString(self,
                          tableName: "Localizable",
                          bundle: .main,
                          value: "",
                          comment: "")
    }
    
    /// returns a localized string, using the main bundle if one is not specified.
    func localized(tableName: String, comment: String = "") -> String {
        NSLocalizedString(self,
                          tableName: tableName,
                          bundle: .main,
                          value: "",
                          comment: comment)
    }
}
