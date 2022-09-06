//
//  TwitterOptionStore.swift
//  SearchBoyAdvance
//
//  Created by HIROKI IKEUCHI on 2022/09/01.
//

import Foundation
import SwiftUI

class TwitterOptionStore: ObservableObject {
    
    @Published var options: [TwitterOption] = []
    
    // MARK: - Save and Load Data
    
    static func load() async throws -> [TwitterOption] {
        try await withCheckedThrowingContinuation { continuation in
            load { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let options):
                    continuation.resume(returning: options)
                }
            }
        }
    }
        
    @discardableResult
    static func save(options: [TwitterOption]) async throws -> Int {
        
        try await withCheckedThrowingContinuation { continuation in
            save(options: options) { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let optionsSaved):
                    continuation.resume(returning: optionsSaved)
                }
            }
        }
    }
    
    // MARK: - Helpers
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("twitter_options.data")
    }
    
    private static func load(completion: @escaping (Result<[TwitterOption], Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    // 初回読み込み時でファイルがない場合
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                
                let options = try JSONDecoder().decode([TwitterOption].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(options))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
        
    private static func save(options: [TwitterOption], completion: @escaping (Result<Int, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(options)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(options.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
