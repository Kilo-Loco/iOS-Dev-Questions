//
//  Name.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

// An object that represents a valid name
struct Name {
    let value: String
    
    init(value: String) throws {
        guard value.count > 1 else { throw NameError.tooShort }
        guard value.count < 50 else { throw NameError.tooLong }
        self.value = value
    }
}

extension Name {
    
    /// Name specific error.
    enum NameError: String, LocalizedError {
        case tooShort = "Name is too short. Please enter a longer name to continue."
        case tooLong = "Name is too short. Please enter a shorter name to continue."
        
        var errorDescription: String? { return rawValue }
    }
}
