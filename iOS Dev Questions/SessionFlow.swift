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
    private let alertService: AlertService
    
    init(context: QuestionsContext = .init(), userSettings: UserSettings, alertService: AlertService = .init()) {
        self.context      = context
        self.userSettings = userSettings
        self.alertService = alertService
    }
    
    func start(with rootViewController: UIViewController) {
        let questionsVC = QuestionsViewController()
        questionsVC.title = "Questions"
        
        questionsVC.getTopics = { [weak self, questionsVC] in
            
            self?.context.getQuestions(completion: { (result) in
                switch result {
                case .success(let topics):
                    questionsVC.topics = topics
                    
                case .failure(let error):
                    guard let alert = self?.alertService.generateAlert(for: error) else { return }
                    questionsVC.present(alert, animated: true)
                }
            })
        }
        
        
        let navigationVC = SessionNavigationController(rootViewController: questionsVC)
        rootViewController.present(navigationVC, animated: true)
    }
}
