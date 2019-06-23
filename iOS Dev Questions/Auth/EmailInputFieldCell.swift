//
//  EmailInputFieldCell.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// An InputFieldCell specialized for email input
final class EmailInputFieldCell: InputFieldCell {
    
    // MARK: - Initializers
    
    override init() {
        super.init()
        configureTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Visual Element Configuration
    
    /// Modies the textfield to be email oriented
    private func configureTextField() {
        textField.textContentType = .emailAddress
        textField.keyboardType = .emailAddress
        textField.placeholder = "Email"
        textField.autocapitalizationType = .none
    }
}
