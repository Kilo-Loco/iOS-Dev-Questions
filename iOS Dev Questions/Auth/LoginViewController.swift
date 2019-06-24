//
//  LoginViewController.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// The Sign Up view controller
final class LoginViewController: UITableViewController {
    
    // MARK: - Communication
    
    var didProvideLoginCredentials: ((_ email: String, _ password: String) -> Void)?
    var showSignUpScreen: EmptyClosure?
    
    // MARK: - Injected Properties
    let mainTableView: LoginView
    
    
    // MARK: - Initializers
    
    init(mainTableView: LoginView = .init()) {
        self.mainTableView = mainTableView
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup View
    
    override func loadView() {
        mainTableView.dataSource = self
        mainTableView.didTapLoginButton = { [weak self] in self?.provideLoginCredentials() }
        mainTableView.didTapSignUpButton = { [weak self] in self?.showSignUpScreen?() }
        view = mainTableView
    }
    
    
    // MARK: - Events
    
    private func provideLoginCredentials() {
        let email    = mainTableView.emailCell.textField.text ?? ""
        let password = mainTableView.passwordCell.textField.text ?? ""
        
        didProvideLoginCredentials?(email, password)
    }
    
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainTableView.cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case .logoCellIndex         : return mainTableView.logoCell
        case .emailCellIndex        : return mainTableView.emailCell
        case .passwordCellIndex     : return mainTableView.passwordCell
        case .loginButtonCellIndex  : return mainTableView.loginButtonCell
        case .signUpButtonCellIndex : return mainTableView.signUpButtonCell
        default: fatalError()
        }
    }
}


// MARK: - Integer Extension used to make index rows more legible
fileprivate extension Int {
    static let logoCellIndex         = 0
    static let emailCellIndex        = 1
    static let passwordCellIndex     = 2
    static let loginButtonCellIndex  = 3
    static let signUpButtonCellIndex = 4
}
