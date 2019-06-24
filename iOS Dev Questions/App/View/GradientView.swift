//
//  GradientView.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// A view that shows a gradient
final class GradientView: UIView {
    
    // MARK: - Injected Properties
    
    private let gradientLayer: CAGradientLayer
    
    
    // MARK: - Initializers
    
    init(gradientLayer: CAGradientLayer = .hotPinkToMangoLayer) {
        self.gradientLayer = gradientLayer
        super.init(frame: .zero)
        
        layer.addSublayer(gradientLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Layout Gradient
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradientLayer.frame = bounds
    }
}
