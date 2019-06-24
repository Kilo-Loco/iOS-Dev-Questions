//
//  QuestionsView.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class QuestionsView: UITableView {
    
    // MARK: - Communication
    
    var didTapSettings: EmptyClosure?
    
    
    // MARK: - Subviews
    
    lazy var settingsBarItem = UIBarButtonItem(image: #imageLiteral(resourceName: "settingsIcon"),
                                               style: .plain,
                                               target: self,
                                               action: #selector(didTapSettingsButton))
    
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero, style: .plain)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: -  Setup
    
    private func setup() {
        separatorStyle = .none
        register(QuestionCell.self, forCellReuseIdentifier: QuestionCell.identifier)
    }
    
    
    // MARK: - Events
    
    @objc
    private func didTapSettingsButton() {
        didTapSettings?()
    }
}
