//
//  FullNameInputFieldCell.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// An InputFieldCell specialized for name input
final class FullNameInputFieldCell: InputFieldCell {
    
    // MARK: - Initializers
    
    override init() {
        super.init()
        configureTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Subviews
    
    /// Modies the textfield to be name oriented
    private func configureTextField() {
        textField.textContentType = .name
        textField.placeholder = "Full Name"
        textField.autocapitalizationType = .none
    }
}
