//
//  SignUpView.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// The tableView displayed to the User for the Sign Up screen.
final class SignUpView: UITableView {
    
    // MARK: - Communication
    
    var didTapSignUpButton: EmptyClosure?
    var didTapLoginButton: EmptyClosure?
    
    // MARK: - Cells
    
    let logoCell         = LogoCell()
    let fullNameCell     = FullNameInputFieldCell()
    let emailCell        = EmailInputFieldCell()
    let passwordCell     = PasswordInputFieldCell()
    let signUpButtonCell = PillButtonCell(buttonTitle: "Sign Up")
    let loginButtonCell  = TextButtonCell(buttonTitle: "I Have An Account")
    
    /// All cells used in the view properly ordered from top to bottom.
    lazy var cells: [UITableViewCell] = [logoCell,
                                         fullNameCell,
                                         emailCell,
                                         passwordCell,
                                         signUpButtonCell,
                                         loginButtonCell]
    
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero, style: .plain)
        setup()
        configureCells()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup Subviews
    
    private func setup() {
        rowHeight                     = UITableView.automaticDimension
        separatorStyle                = .none
        keyboardDismissMode           = .interactive
        showsVerticalScrollIndicator  = false
    }
    
    /// Specializes each of the cells for the Sign Up screen and connects their primary actions
    func configureCells() {
        fullNameCell.textField.returnKeyType = .next
        fullNameCell.primaryAction = { [weak self] in self?.emailCell.textField.becomeFirstResponder() }
        
        emailCell.textField.returnKeyType = .next
        emailCell.primaryAction = { [weak self] in self?.passwordCell.textField.becomeFirstResponder() }
        
        passwordCell.textField.returnKeyType = .done
        passwordCell.primaryAction = { [weak self] in self?.passwordCell.textField.endEditing(true) }
        
        signUpButtonCell.didTapButton = { [weak self] in self?.didTapSignUpButton?() }
        loginButtonCell.didTapButton = { [weak self] in self?.didTapLoginButton?() }
    }
}
