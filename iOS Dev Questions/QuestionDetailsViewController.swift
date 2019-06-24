//
//  QuestionDetailsViewController.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class QuestionDetailsViewController: UIViewController {
    
    // MARK: - Injected Properties
    
    private let mainView: QuestionDetailsView
    private let question: Question
    
    // MARK: - Initializers
    
    init(mainView: QuestionDetailsView = .init(), question: Question) {
        self.mainView = mainView
        self.question = question
        super.init(nibName: nil, bundle: nil)
        
        configureMainView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup Subviews
    
    override func loadView() {
        view = mainView
    }
    
    private func configureMainView() {
        navigationItem.largeTitleDisplayMode = .never
        mainView.questionLabel.text = question.value
        mainView.answerTextView.text = question.answer
    }
}
