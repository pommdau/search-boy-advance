//
//  TwitterOption+enum.swift
//  SearchBoyAdvance
//
//  Created by HIROKI IKEUCHI on 2022/09/04.
//

import Foundation

extension TwitterOption {
    
    enum SortedType: String, Codable, CaseIterable, Identifiable {
        case featured // 話題のツイート
        case live  // 最新
        
        var id: Self { self }

        var name: String {
            switch self {
            case .featured:
                return "Top".localize
            case .live:
                return "Latest".localize
            }
        }
    }
    
    enum MediaType: String, Codable, CaseIterable, Identifiable {
        case none
        case images
        case videos
        case gifs
        
        var id: Self { self }

        var name: String {
            switch self {
            case .none:
                return "(Not specified)"
            case .images:
                return "Image"
            case .videos:
                return "Video"
            case .gifs:
                return "GIF"
            }
        }
    }
    
    enum Language: String, Codable, CaseIterable, Identifiable {
        case none = "none"
        case japanese = "ja"
        case english = "en"
        case german = "de"
        case french = "fr"
        case spanish = "es"
        case italian = "it"
        case dutch = "nl"  // オランダ語
        case russian = "ru"
        case chinese = "zh"
        case korean = "ko"
        
        var id: Self { self }

        var name: String {
            switch self {
            case .none:
                return "(Not specified)"
            case .japanese:
                return "Japanese"
            case .english:
                return "English"
            case .german:
                return "German"
            case .french:
                return "French"
            case .spanish:
                return "Spanish"
            case .italian:
                return "Italian"
            case .dutch:
                return "Dutch"
            case .russian:
                return "Russian"
            case .chinese:
                return "Chinese"
            case .korean:
                return "Korean"
            }
        }
    }
    
    /// ref: https://www.quicktranslate.com/blog/2017/11/jst%E3%80%81gmt%E3%80%81utc%E3%81%A8%E3%81%AF%EF%BC%9F-%E8%8B%B1%E8%AA%9E%E3%81%A7%E6%8A%BC%E3%81%95%E3%81%88%E3%82%8B%E3%81%B9%E3%81%8D%E6%97%A5%E6%9C%AC%E3%81%A8%E4%B8%96%E7%95%8C%E3%81%AE%E6%A8%99/
    enum TimeZone: String, Codable, CaseIterable, Identifiable {
        case none = "none"
        case jst = "JST"
        case gmt = "GMT"
        case utc = "UTC"
        case est = "EST"
        case cst = "CST"
        case mst = "MST"
        case pst = "PST"
        case akst = "AKST"
        case hst = "HST"
        case cet = "CET"
        case wet = "WET"
        case eet = "EET"
        
        var id: Self { self }

        var name: String {
            switch self {
            case .none:
                return "(Not specified)"
            default:
                return self.rawValue
            }
        }
    }

}
