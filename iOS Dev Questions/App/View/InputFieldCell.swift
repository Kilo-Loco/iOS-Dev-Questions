//
//  InputFieldCell.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// A UITableViewCell that has an underlined UITextField in it
class InputFieldCell: UITableViewCell {

    // MARK: - Communication
    
    /// Called when the user taps the primary action on the keyboard
    var primaryAction: EmptyClosure?
    
    
    // MARK: - Subviews
    
    lazy var textField: UITextField = { [unowned self] in
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .preferredFont(forTextStyle: .body)
        textField.addTarget(self, action: #selector(didTriggerPrimaryAction), for: .primaryActionTriggered)
        return textField
    }()
    
    private lazy var underlineView: GradientView = {
        let view = GradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var gradientLayer: CAGradientLayer = .hotPinkToMangoLayer
    
    // MARK: - Initializers
    
    init() {
        super.init(style: .default, reuseIdentifier: InputFieldCell.identifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup Subviews
    
    private func setup() {
        selectionStyle = .none
        
        underlineView.layer.addSublayer(gradientLayer)
        
        contentStackView.addArrangedSubview(textField)
        contentStackView.addArrangedSubview(underlineView)
        
        contentView.addSubview(contentStackView)
        
        let guide = contentView.layoutMarginsGuide
        let edgePadding: CGFloat = 20
        NSLayoutConstraint.activate([
            underlineView.heightAnchor.constraint(equalToConstant: 3),
            
            contentStackView.topAnchor.constraint(equalTo: guide.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: edgePadding),
            contentStackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor,constant: -edgePadding),
            contentStackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
            ])
    }
    
    
    // MARK: - Events
    
    /// Handles the primary action from the keyboard
    @objc
    private func didTriggerPrimaryAction() {
        DispatchQueue.main.async { [weak self] in
            self?.primaryAction?()
        }
    }
}

extension InputFieldCell: IdentifiableCell {}
