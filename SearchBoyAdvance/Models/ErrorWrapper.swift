//
//  ErrorWrapper.swift
//  SearchBoyAdvance
//
//  Created by HIROKI IKEUCHI on 2022/09/01.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(error: Error, guidance: String, id: UUID = UUID()) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
