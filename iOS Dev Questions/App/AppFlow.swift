//
//  AppFlow.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/21/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit
import Firebase

/// Responsible for navigating the user to the correct flow based on the context
final class AppFlow {
    
    // MARK: - Possible Flows
    private lazy var onboardingFlow = OnboardingFlow(userSettings: context.userSettings)
    private lazy var authFlow = AuthFlow(userSettings: context.userSettings)
    private lazy var sessionFlow = SessionFlow(userSettings: context.userSettings)
    
    // MARK: - Injected Instance Variables
    private let context: AppContext
    private let window: UIWindow
    
    // MARK: - Computed Properties
    private var rootViewController: UIViewController { return window.rootViewController! }
    
    // MARK: - Initializer
    init(context: AppContext, window: UIWindow?) {
        self.context = context
        self.window = window ?? .init()
    }
    
    // MARK: - Launching Configurations
    
    /// Configures the window to an intial state and starts the subflow configuration
    ///
    /// - Returns: Will always return true after didStartSubFlow finishes
    func didFinishLaunching() -> Bool {
        window.rootViewController = InitialViewController()
        window.makeKeyAndVisible()
        
        FirebaseApp.configure()
        
        return didStartSubFlow()
    }
    
    // MARK: - Flow Management
    
    /// Based on the state of the app context, the corresponding flow will be started
    ///
    /// - Returns: Always returns true after designated flow has been started
    private func didStartSubFlow() -> Bool {
        switch context.state {
        case .onboarding: startOnboardingFlow()
        case .auth: startAuthFlow()
        case .session: break
//            startSessionFlow()
        }
        
        return true
    }
    
    // MARK: Flow Starters
    
    /// Responsible for configuring the onboarding flow and handling flow after it has finished
    private func startOnboardingFlow() {
        onboardingFlow.start(with: rootViewController)
        onboardingFlow.didFinish = { [weak self] in
            
            self?.startAuthFlow()
        }
    }
    
    /// Responsible for configuring the auth flow and handling flow after it has finished
    private func startAuthFlow() {
        authFlow.startSignUp(with: rootViewController)
        authFlow.signIn = { [weak self] in self?.startSessionFlow(with: $0) }
    }
    
    /// Responsible for configuring the main flow and navigating after logging out
    private func startSessionFlow(with user: User) {
        sessionFlow.start(with: rootViewController)
        sessionFlow.logout = { [weak self] in self?.startAuthFlow() }
    }
}
