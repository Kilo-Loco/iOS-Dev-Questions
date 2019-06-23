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
    
    // MARK: - Communication
    
    /// Called once the user has been authorized and received credentials to enter the main app
    var signIn: EmptyClosure?
    
    
    // MARK: - Injected properties
    
    private let context: AuthContext
    private let userSettings: UserSettings
    
    
    // MARK: - Initializer
    
    init(context: AuthContext = .init(), userSettings: UserSettings) {
        self.context = context
        self.userSettings = userSettings
    }
    
    // MARK: - Start Flow
    
    /// Starts the AuthFlow from the Sign Up screen
    ///
    /// - Parameter rootViewController: The presenting view controller.
    func startSignUp(with rootViewController: UIViewController) {
        let signUpVC = SignUpViewController()
        rootViewController.present(signUpVC, animated: true)
    }
    
    /// Starts the AuthFlow from the Login screen
    ///
    /// - Parameter rootViewController: The presenting view controller.
    func startLogin(with rootViewController: UIViewController) {
        
    }
}
