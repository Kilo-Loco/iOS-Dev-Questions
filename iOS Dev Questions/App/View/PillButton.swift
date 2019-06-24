//
//  PillButton.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// A button with rounded corners like a pill with a gradient background
class PillButton: UIButton {
    
    // MARK: - Communication
    
    var didTap: EmptyClosure?
    
    
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
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        let cornerRadius = bounds.height / 2
        layer.cornerRadius = cornerRadius
        
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
    }
    
    private func setup() {
        layer.addSublayer(gradientLayer)
        
        setTitle(title, for: .normal)
        
        titleLabel?.font = .preferredFont(forTextStyle: .headline)
        
        addTarget(self, action: #selector(didReceiveTap), for: .touchUpInside)
    }
    
    
    // MARK: - Events
    
    @objc
    private func didReceiveTap() {
        didTap?()
    }
}
