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
    
    // MARK: - Communication
    
    /// Called once the user has requested to logout and end their session
    var logout: EmptyClosure?
    
    
    // MARK: - Injected Properties
    
    private let sessionNavigationController: SessionNavigationController
    private let context: QuestionsContext
    private let userSettings: UserSettings
    private let alertService: AlertService
    
    init(sessionNavigationController: SessionNavigationController = .init(),
         context: QuestionsContext = .init(),
         userSettings: UserSettings,
         alertService: AlertService = .init()) {
        
        self.sessionNavigationController = sessionNavigationController
        self.context                     = context
        self.userSettings                = userSettings
        self.alertService                = alertService
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
        
        questionsVC.showSettings = { [weak self] in self?.showSettings() }
        questionsVC.showQuestionDetails = { [weak self] in self?.showDetails(for: $0) }
        
        sessionNavigationController.pushViewController(questionsVC, animated: false)
        
        rootViewController.present(sessionNavigationController, animated: true)
    }
    
    private func showDetails(for question: Question) {
        let questionDetailsVC = QuestionDetailsViewController(question: question)
        sessionNavigationController.pushViewController(questionDetailsVC, animated: true)
    }
    
    private func showSettings() {
        print("settings")
    }
}
