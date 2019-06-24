//
//  TextButtton.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// A button displayed as text.
class TextButton: UIButton {
    
    // MARK: - Communication
    
    var didTap: EmptyClosure?
    
    // MARK: - Subviews
    
    private lazy var gradientView: GradientView = GradientView(gradientLayer: gradientLayer)
    
    
    // MARK: - Injected Properties
    
    private let title: String
    private let gradientLayer: CAGradientLayer
    
    
    // MARK: - Initializers
    
    init(title: String, gradientLayer: CAGradientLayer = .hotPinkToMangoLayer) {
        self.title = title
        self.gradientLayer = gradientLayer
        
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 250, height: 50)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientView.frame = bounds
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradientLayer.frame = gradientView.bounds
    }
    
    private func setup() {
        setTitle(title, for: .normal)
        
        titleLabel?.font = .preferredFont(forTextStyle: .headline)
        
        gradientView.mask = titleLabel
        addSubview(gradientView)
    }
    
    
    // MARK: - Events
    
    @objc
    private func didReceiveTap() {
        didTap?()
    }
}
