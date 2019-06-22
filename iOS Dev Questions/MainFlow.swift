//
//  MainFlow.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/22/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// Responsible for guiding the user through the main app
final class MainFlow {
    
    /// Called once the user has requested to logout and end their session
    var logout: EmptyClosure?
    
    private let context: AuthContext
    private let userSettings: UserSettings
    
    init(context: AuthContext = .init(), userSettings: UserSettings) {
        self.context = context
        self.userSettings = userSettings
    }
    
    func start(with viewController: UIViewController) {
        
    }
}
