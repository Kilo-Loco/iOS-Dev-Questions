//
//  TopicHeaderView.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class TopicHeaderView: UIView {
    
    // MARK: - Communication
    
    /// Called when the header recieves a tap anywhere
    var onTap: EmptyClosure?
    
    
    // MARK: - Subviews
    
    private lazy var titleLabel: UILabel = { [unowned self] in
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .white
        label.text = title
        return label
    }()
    
    private lazy var tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didReceiveTap))
    private lazy var gradientLayer: CAGradientLayer = .hotPinkToMangoLayer
    
    
    // MARK: - Injected Properties
    
    private let title: String
    
    
    // MARK: - Initializers
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup Subviews
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradientLayer.frame = bounds
    }
    
    private func setup() {
        layer.addSublayer(gradientLayer)
        
        addGestureRecognizer(tapRecognizer)
        
        addSubview(titleLabel)
        
        let guide = layoutMarginsGuide
        let edgePadding: CGFloat = 16
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: guide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: edgePadding),
            titleLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -edgePadding),
            titleLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
            ])
    }
    
    // MARK: - Events
    
    @objc
    private func didReceiveTap() {
        onTap?()
    }
}
