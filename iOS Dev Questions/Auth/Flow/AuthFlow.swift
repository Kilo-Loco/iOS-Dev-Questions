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
    var signIn: ((User) -> Void)?
    
    
    // MARK: - Injected properties
    
    private let context: AuthContext
    private let userSettings: UserSettings
    private let alertService: AlertService
    
    
    // MARK: - Initializer
    
    init(context: AuthContext = .init(), userSettings: UserSettings, alertService: AlertService = .init()) {
        self.context = context
        self.userSettings = userSettings
        self.alertService = alertService
    }
    
    // MARK: - Start Flow
    
    /// Starts the AuthFlow from the Sign Up screen
    ///
    /// - Parameter rootViewController: The presenting view controller.
    func startSignUp(with rootViewController: UIViewController) {
        let signUpVC = SignUpViewController()
        
        // Handle when the user is attempting to sign up
        signUpVC.didProvideSignUpCredentials = { [weak self, signUpVC] in
            
            self?.context.signUp(with: $0, $1, $2) { (result) in
                
                switch result {
                case .success(let user):
                    signUpVC.dismiss(animated: true)
                    self?.signIn?(user)
                    
                case .failure(let error):
                    guard let alert = self?.alertService.generateAlert(for: error) else { return }
                    signUpVC.present(alert, animated: true)
                }
            }
        }
        
        // User already has an account and wants to login
        signUpVC.showLoginScreen = { [weak self, signUpVC] in
            if signUpVC.presentingViewController?.isKind(of: LoginViewController.self) == true {
                signUpVC.dismiss(animated: true)
            } else {
                self?.startLogin(with: signUpVC)
            }
        }
        rootViewController.present(signUpVC, animated: true)
    }
    
    /// Starts the AuthFlow from the Login screen
    ///
    /// - Parameter rootViewController: The presenting view controller.
    func startLogin(with rootViewController: UIViewController) {
        let loginVC = LoginViewController()
        
        // Handle when the user is attempting to login
        loginVC.didProvideLoginCredentials = { [weak self, loginVC] in
            
            self?.context.login(with: $0, $1) { (result) in
                
                switch result {
                case .success(let user):
                    loginVC.dismiss(animated: true)
                    self?.signIn?(user)
                    
                case .failure(let error):
                    guard let alert = self?.alertService.generateAlert(for: error) else { return }
                    loginVC.present(alert, animated: true)
                }
            }
        }
        
        // User doesn't have an account and needs to sign up
        loginVC.showSignUpScreen = { [weak self, loginVC] in
            if loginVC.presentingViewController?.isKind(of: SignUpViewController.self) == true {
                loginVC.dismiss(animated: true)
            } else {
                self?.startSignUp(with: loginVC)
            }
        }
        rootViewController.present(loginVC, animated: true)
    }
}
