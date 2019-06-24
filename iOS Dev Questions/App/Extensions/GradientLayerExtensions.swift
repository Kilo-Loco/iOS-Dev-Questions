//
//  GradientLayerExtensions.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    static var hotPinkToMangoLayer: CAGradientLayer {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.hotPink.cgColor, UIColor.mango.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        return layer
    }
    
}
