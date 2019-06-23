//
//  OnboardingView.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/22/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

final class OnboardingView: UIView {
    
    var didTapSkipButton: (() -> Void)?
    
    lazy var collectionView: OnboardingDataCollectionView = {
        let collectionView = OnboardingDataCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var skipButton: UIButton = { [unowned self] in
        let button = UIButton()
        button.accessibilityLabel = "Skip"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Skip", for: .normal)
        button.addTarget(self, action: #selector(_didTapSkipButton), for: .touchUpInside)
        button.setTitleColor(.hotPink, for: .normal)
        return button
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .mango
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        
        addSubview(collectionView)
        addSubview(skipButton)
        addSubview(pageControl)
        
        let guide = layoutMarginsGuide
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            skipButton.topAnchor.constraint(equalTo: guide.topAnchor),
            skipButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            
            pageControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            pageControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            pageControl.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -50),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
            
            ])
    }
    
    @objc
    private func _didTapSkipButton() {
        didTapSkipButton?()
    }
    
}
