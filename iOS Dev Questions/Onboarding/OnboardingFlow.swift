//
//  OnboardingFlow.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/21/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// Responsible for guiding the user through the entire Onboarding process
final class OnboardingFlow {
    
    /// Called once the user has finished the onboarding process (both skip & done)
    var didFinish: EmptyClosure?
    
    private let userSettings: UserSettings
    
    init(userSettings: UserSettings) {
        self.userSettings = userSettings
    }
    
    func start(with viewController: UIViewController) {
        
    }
}
