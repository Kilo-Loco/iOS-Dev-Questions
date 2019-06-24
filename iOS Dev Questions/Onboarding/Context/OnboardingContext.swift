//
//  OnboardingContext.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/22/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// Responsible for managing the data that will be presented in the onboarding process. This
/// is where the onboarding items are defined.
final class OnboardingContext: NSObject {
    
    /// The data that will be presented in the onboarding slides.
    let onboardingItems: [OnboardingItem] = [
        OnboardingItem(title: "Grouped Questions",
                       image: #imageLiteral(resourceName: "groupedQuestionsIcon"),
                       description: "Discover interview questions by their associated group."),
        
        OnboardingItem(title: "Memorable Answers",
                       image: #imageLiteral(resourceName: "memorableAnswersIcon"),
                       description: "Each question is accompanied by short, memorable answers."),
        
        OnboardingItem(title: "Submit A Question",
                       image: #imageLiteral(resourceName: "submitQuestionIcon"),
                       description: "Contribute to the list of questions by requesting your a new question.")
    ]
}
