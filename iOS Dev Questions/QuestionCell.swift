//
//  QuestionCell.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// This cell displays the question in a label
final class QuestionCell: UITableViewCell {
    
    // MARK: - Subviews
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()
    
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup Subviews
    
    private func setup() {
        selectionStyle = .none
        
        contentView.addSubview(questionLabel)
        
        let guide = contentView.layoutMarginsGuide
        let edgePadding: CGFloat = 16
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: guide.topAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: edgePadding),
            questionLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -edgePadding),
            questionLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
            ])
    }
    
}

extension QuestionCell: IdentifiableCell {}
