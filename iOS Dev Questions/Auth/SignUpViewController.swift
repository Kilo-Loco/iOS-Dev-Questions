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
    
    // MARK: - Cells
    
    private let logoCell         = LogoCell()
    private let fullNameCell     = FullNameInputFieldCell()
    private let emailCell        = EmailInputFieldCell()
    private let passwordCell     = PasswordInputFieldCell()
    private let signUpButtonCell = PillButtonCell(buttonTitle: "Sign Up")
    
    /// All cells used in the view properly ordered from top to bottom.
    private lazy var cells: [UITableViewCell] = [logoCell,
                                                 fullNameCell,
                                                 emailCell,
                                                 passwordCell,
                                                 signUpButtonCell]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Setup Visual Elements
    
    /// Configures the visual properties of the table view used to display the sign up elements
    private func setupTableView() {
        tableView.rowHeight           = UITableView.automaticDimension
        tableView.separatorStyle      = .none
        tableView.keyboardDismissMode = .interactive
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case .logoCellIndex         : return logoCell
        case .fullNameCellIndex     : return fullNameCell
        case .emailCellIndex        : return emailCell
        case .passwordCellIndex     : return passwordCell
        case .signUpButtonCellIndex : return signUpButtonCell
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
}
