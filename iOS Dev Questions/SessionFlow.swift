//
//  SessionFlow.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/22/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// Responsible for guiding the user through the app during a session
final class SessionFlow {
    
    /// Called once the user has requested to logout and end their session
    var logout: EmptyClosure?
    
    private let context: QuestionsContext
    private let userSettings: UserSettings
    
    init(context: QuestionsContext = .init(), userSettings: UserSettings) {
        self.context = context
        self.userSettings = userSettings
    }
    
    func start(with rootViewController: UIViewController) {
        let question = Question(value: "What's the difference between bounds and frame?", answer: "The frame is the actual location of the object in the parent view. The bounds are where the contents location inside of the view in question.", creationDate: Date())
        let topic = Topic(title: "test", questions: [question])
        let questionsVC = QuestionsViewController(topics: [topic])
        questionsVC.title = "Questions"
        let navigationVC = SessionNavigationController(rootViewController: questionsVC)
        rootViewController.present(navigationVC, animated: true)
    }
}
