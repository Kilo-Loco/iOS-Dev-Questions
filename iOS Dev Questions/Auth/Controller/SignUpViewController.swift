//
//  SignUpViewController.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/22/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// The Sign Up view controller
final class SignUpViewController: UITableViewController {
    
    // MARK: - Communication
    
    var didProvideSignUpCredentials: ((_ fullName: String, _ email: String, _ password: String) -> Void)?
    var showLoginScreen: EmptyClosure?
    
    
    // MARK: - Injected Properties
    
    let mainTableView: SignUpView
    
    
    // MARK: - Initializers
    
    init(mainTableView: SignUpView = .init()) {
        self.mainTableView = mainTableView
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup View
    
    override func loadView() {
        mainTableView.dataSource = self
        mainTableView.didTapSignUpButton = { [weak self] in self?.provideSignUpCredentials() }
        mainTableView.didTapLoginButton = { [weak self] in self?.showLoginScreen?() }
        view = mainTableView
    }
    
    
    // MARK: - Events
    
    private func provideSignUpCredentials() {
        let fullName = mainTableView.fullNameCell.textField.text ?? ""
        let email    = mainTableView.emailCell.textField.text ?? ""
        let password = mainTableView.passwordCell.textField.text ?? ""
        
        didProvideSignUpCredentials?(fullName, email, password)
    }
    
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainTableView.cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case .logoCellIndex         : return mainTableView.logoCell
        case .fullNameCellIndex     : return mainTableView.fullNameCell
        case .emailCellIndex        : return mainTableView.emailCell
        case .passwordCellIndex     : return mainTableView.passwordCell
        case .signUpButtonCellIndex : return mainTableView.signUpButtonCell
        case .loginButtonCellIndex  : return mainTableView.loginButtonCell
        default: fatalError()
        }
    }
}


// MARK: - Integer Extension used to make index rows more legible
fileprivate extension Int {
    static let logoCellIndex         = 0
    static let fullNameCellIndex     = 1
    static let emailCellIndex        = 2
    static let passwordCellIndex     = 3
    static let signUpButtonCellIndex = 4
    static let loginButtonCellIndex  = 5
}
