//
//  PasswordInputFieldCell.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// An InputFieldCell specialized for password input
final class PasswordInputFieldCell: InputFieldCell {
    
    // MARK: - Initializers
    
    override init() {
        super.init()
        configureTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Visual Element Configuration
    
    /// Modies the textfield to be password oriented
    private func configureTextField() {
        textField.textContentType = .password
        textField.placeholder = "Password"
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
    }
}

