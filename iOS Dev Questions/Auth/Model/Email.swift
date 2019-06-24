//
//  Email.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

/// An object that represents a valid email address
struct Email {
    let value: String
    
    init(value: String) throws {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let matches = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        guard matches.evaluate(with: value) else { throw EmailError.invalidEmail }
        
        self.value = value
    }
}

extension Email {
    
    /// Email specific errors
    enum EmailError: String, LocalizedError {
        case invalidEmail = "This email is invalid. Please enter a valid email to continue."
        
        var errorDescription: String? { return rawValue }
    }
}
