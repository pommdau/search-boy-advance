//
//  Date+Extension.swift
//  SearchBoyAdvance
//
//  Created by HIROKI IKEUCHI on 2022/08/28.
//
//  ref: https://gist.github.com/kunikullaya/6474fc6537ed616b1c617646d263555d

import Foundation

extension Date {

    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
