//
//  OnboardingDataCollectionView.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/22/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// The collection view that actually shows the onboarding slides
final class OnboardingDataCollectionView: UICollectionView {
    
    // MARK: - Initializers
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configurations to the collection view itself
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        isPagingEnabled = true
        showsHorizontalScrollIndicator = false
        backgroundColor = .clear
        register(OnboardingViewCell.self, forCellWithReuseIdentifier: OnboardingViewCell.identifier)
    }
    
}
