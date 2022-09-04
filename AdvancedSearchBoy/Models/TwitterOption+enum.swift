//
//  TwitterOption+enum.swift
//  AdvancedSearchBoy
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
                return "Top"
            case .live:
                return "Latest"
            }
        }

        var queryValue: String? {
            switch self {
            case .featured:
                return nil
            case .live:
                return "live"
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
                return "Not specified"
            case .images:
                return "Image"
            case .videos:
                return "Video"
            case .gifs:
                return "GIF"
            }
        }

        var queryValue: String? {
            switch self {
            case .none:
                return nil
            case .images:
                return "filter:images"
            case .videos:
                return "filter:videos"
            case .gifs:
                return "card_name:animated_gif"
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
            self.rawValue.initialUppercased()
        }

        var queryValue: String? {
            switch self {
            case .none:
                return nil
            default:
                return "lang:\(self.rawValue)"
            }
        }
    }
}
