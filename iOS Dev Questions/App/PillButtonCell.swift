//
//  PillButtonCell.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class PillButtonCell: UITableViewCell {
    
    // MARK: - Communication
    
    var didTapButton: EmptyClosure?
    
    // MARK: - Visual Elements
    
    lazy var button: PillButton = { [unowned self] in
        let button = PillButton(title: buttonTitle)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // MARK: - Injected Properties
    
    let buttonTitle: String
    
    
    // MARK: - Initializers
    
    init(buttonTitle: String) {
        self.buttonTitle = buttonTitle
        super.init(style: .default, reuseIdentifier: PillButtonCell.identifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup Visual Elements
    
    private func setup() {
        button.didTap = { [weak self] in self?.didTapButton?() }
        
        contentView.addSubview(button)
        
        let guide = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            button.topAnchor.constraint(equalTo: guide.topAnchor),
            button.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
            ])
    }
}

extension PillButtonCell: IdentifiableCell {}
