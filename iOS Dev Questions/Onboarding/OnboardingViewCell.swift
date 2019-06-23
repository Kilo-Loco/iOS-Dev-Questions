//
//  OnboardingViewCell.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/22/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// The slide (cell) responsible for presenting onboarding information to
/// the user.
final class OnboardingViewCell: UICollectionViewCell {
    
    // MARK: - Visual Elements
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    lazy var featureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Visual Element Setup
    
    private func setup() {
        let verticalSpacing = bounds.height * 0.06
        contentStackView.spacing = verticalSpacing
        
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(featureImageView)
        contentStackView.addArrangedSubview(descriptionLabel)
        
        contentView.addSubview(contentStackView)
        
        let guide = layoutMarginsGuide
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: guide.topAnchor, constant: verticalSpacing),
            contentStackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            contentStackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            
            featureImageView.heightAnchor.constraint(equalTo: featureImageView.widthAnchor)
            ])
    }
}

// MARK: - IdentifiableCell
extension OnboardingViewCell: IdentifiableCell {}
