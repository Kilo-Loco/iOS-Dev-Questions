//
//  UserSettings.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/21/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

/// A UserDefaults wrapper that makes saving and reading values safer
final class UserSettings {
    
    private let defaults: UserDefaults
    
    init() {
        self.defaults = UserDefaults.standard
    }
    
    /// Setting a value for a specified Key
    ///
    /// - Parameters:
    ///   - value: The new value to be saved
    ///   - key: The key that should be updated
    func set(_ value: Any, for key: Key) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    /// Reading the value for a specified key
    ///
    /// - Parameter key: The key that should be read
    /// - Returns: The value, if any, for the spefied key
    func value(for key: Key) -> Any? {
        return defaults.value(forKey: key.rawValue)
    }
    
    /// Reads the value for a specified key and returns the a boolean
    ///
    /// - Parameter key: The key that should be read
    /// - Returns: The value for the specified key as a boolean. Returns false
    ///            if the value cannot be properly casted to a boolean
    func bool(for key: Key) -> Bool {
        return value(for: key) as? Bool ?? false
    }
}

extension UserSettings {
    
    /// All possible keys that can be read and written to
    enum Key: String {
        case didFinishOnboarding
        case userHasSignedIn
    }
}

