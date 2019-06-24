//
//  LogoCell.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// Displays the logo of the app
final class LogoCell: UITableViewCell {
    
    // MARK: - Subviews
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "launchIcon")
        return imageView
    }()

    // MARK: Constraints
    
    static let maximumImageSize: CGFloat = 500
    
    // MARK: - Initializers
    
    init() {
        super.init(style: .default, reuseIdentifier: LogoCell.identifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Subviews
    
    private func setup() {
        selectionStyle = .none
        
        contentView.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            // logoImageView should be centered in the cell
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // logoImageView paddinging from edges of the screen
            logoImageView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 30),
            logoImageView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -30),
            
            //logoImageView shouldn't be overly stretched out on large screen sizes
            logoImageView.widthAnchor.constraint(lessThanOrEqualToConstant: LogoCell.maximumImageSize),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            logoImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
            ])
    }
    
}

extension LogoCell: IdentifiableCell {}
