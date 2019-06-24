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
    
    // MARK: - Communication (Closures)
    
    /// Called once the user has finished the onboarding process (both skip & done)
    var didFinish: EmptyClosure?
    
    
    // MARK: - Injected Properties
    
    private let context: OnboardingContext
    private let userSettings: UserSettings
    
    
    // MARK: - Initializer
    
    init(context: OnboardingContext = .init(), userSettings: UserSettings) {
        self.context = context
        self.userSettings = userSettings
    }
    
    
    // MARK: - Start Flow
    
    /// Used to configure the OnboardingViewController and present on the rooViewController
    ///
    /// - Parameter rootViewController: The InitialViewController since this flow is accessible
    ///                                 from launch
    func start(with rootViewController: UIViewController) {
        let onboardingVC = OnboardingViewController(onboardingItems: context.onboardingItems)
        onboardingVC.didFinishOnboarding = { [weak self, onboardingVC] in
            onboardingVC.dismiss(animated: true)
            self?.finishOnboarding()
        }
        rootViewController.present(onboardingVC, animated: false)
    }
    
    
    // MARK: - End Flow
    
    /// Responsible for updating UserSettings for finishing the onboaring process and
    /// notifying listeners that the flow has finished.
    private func finishOnboarding() {
        userSettings.set(true, for: .didFinishOnboarding)
        didFinish?()
    }
}
