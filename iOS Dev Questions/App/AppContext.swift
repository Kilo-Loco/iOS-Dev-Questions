//
//  AppContext.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/21/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// Responsible for managing the state of the app
final class AppContext: NSObject {
    
    // MARK: Instance of State
    private(set) lazy var state: State = {
        determineAppState()
    }()
    
    // MARK: - Injected Instance Variables
    private let application: UIApplication
    let userSettings: UserSettings
    private let persistence: PersistenceService
    
    // MARK: - Initializer
    init(application: UIApplication,
         userSettings: UserSettings = .init(),
         persistenceInteractor: PersistenceService = .init()) {
        self.application = application
        self.userSettings = userSettings
        self.persistence = persistenceInteractor
    }
    
    // MARK: - State Management
    
    /// Run logic against the UserSettings to determine where the user should be directed
    ///
    /// - Returns: The correct app state for the user
    private func determineAppState() -> State {
        
        if userSettings.bool(for: .didFinishOnboarding) {
            // User has already gone throug onboarding
            
            if userSettings.bool(for: .userHasSignedIn) {
                // User has successfully signed in
                return .session
                
            } else {
                // User is not signed in
                return .auth
            }
            
        } else {
            // User has not gone through onboarding process yet
            return .onboarding
        }
    }
    
    // MARK: - Observer Setup
    
    /// Token reference for the app entered background observation
    private var didEnterBackgroundObservationToken: ObservationToken?
    
    /// Responsible for the different app events usually found in the AppDelegate
    private func observeAppChange() {
        
        // Sends out a notification when the app enters the background
        didEnterBackgroundObservationToken = NotificationCenter.default
            .addObserver(forName: .NSExtensionHostDidEnterBackground,
                         object: nil,
                         queue: nil) { [weak self] (_) in
                            
                            // Triggers the persistence interactor to save any unsaved changes
                            self?.persistence.save()
        }
    }
}

extension AppContext {
    enum State {
        // User is presented with the onboarding screens to learn about the app
        case onboarding
        
        // User needs to sign in. They already have gone through onboarding
        case auth
        
        // User has successfully signed in and can use the main app
        case session
    }
}
