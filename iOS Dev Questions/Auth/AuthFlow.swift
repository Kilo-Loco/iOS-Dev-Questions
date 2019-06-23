//
//  AuthFlow.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/21/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// Responsible for guiding the user through the entire authorization process (Sign Up & Login)
final class AuthFlow {
    
    /// Called once the user has been authorized and received credentials to enter the main app
    var signIn: EmptyClosure?
    
    private let context: AuthContext
    private let userSettings: UserSettings
    
    init(context: AuthContext = .init(), userSettings: UserSettings) {
        self.context = context
        self.userSettings = userSettings
    }
    
    
    
    func start(with viewController: UIViewController) {
        
    }
}
