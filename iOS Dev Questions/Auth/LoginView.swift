//
//  LoginView.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// The tableView displayed to the User for the Sign Up screen.
final class LoginView: UITableView {
    
    // MARK: - Communication
    
    var didTapLoginButton: EmptyClosure?
    var didTapSignUpButton: EmptyClosure?
    
    
    // MARK: - Cells
    
    let logoCell         = LogoCell()
    let emailCell        = EmailInputFieldCell()
    let passwordCell     = PasswordInputFieldCell()
    let loginButtonCell  = PillButtonCell(buttonTitle: "Login")
    let signUpButtonCell = TextButtonCell(buttonTitle: "Create An Account")
    
    /// All cells used in the view properly ordered from top to bottom.
    lazy var cells: [UITableViewCell] = [logoCell,
                                         emailCell,
                                         passwordCell,
                                         loginButtonCell,
                                         signUpButtonCell]
    
    
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
        
        emailCell.textField.returnKeyType = .next
        emailCell.primaryAction = { [weak self] in self?.passwordCell.textField.becomeFirstResponder() }
        
        passwordCell.textField.returnKeyType = .done
        passwordCell.primaryAction = { [weak self] in self?.passwordCell.textField.endEditing(true) }
        
        loginButtonCell.didTapButton  = { [weak self] in self?.didTapLoginButton?() }
        signUpButtonCell.didTapButton = { [weak self] in self?.didTapSignUpButton?() }
    }
}
