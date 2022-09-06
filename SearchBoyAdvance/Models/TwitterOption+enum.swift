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
}
