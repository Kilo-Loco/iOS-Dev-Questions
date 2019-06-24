//
//  Password.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

/// An object that represents a valid password
struct Password {
    let value: String
    
    init(value: String) throws {
        guard value.count > 5 else { throw PasswordError.tooShort }
        guard value.count < 50 else { throw PasswordError.tooLong }
        
        self.value = value
    }
}

extension Password {
    
    /// A password specific error
    enum PasswordError: String, LocalizedError {
        case tooShort = "The password is too short. Please enter a longer password to continue."
        case tooLong = "The password is too long. Please enter a shorter password to continue."
        
        var errorDescription: String? { return rawValue }
    }
}
