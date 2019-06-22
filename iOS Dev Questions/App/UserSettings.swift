//
//  UserSettings.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/21/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

final class UserSettings {
    
    private let defaults: UserDefaults
    
    init() {
        self.defaults = UserDefaults.standard
    }
    
    func set(_ value: Any, for key: Key) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    func value(for key: Key) -> Any? {
        return defaults.value(forKey: key.rawValue)
    }
    
    func bool(for key: Key) -> Bool {
        return value(for: key) as? Bool ?? false
    }
}

extension UserSettings {
    enum Key: String {
        case didFinishOnboarding
        case userHasSignedIn
    }
}

