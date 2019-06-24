//
//  OnboardingViewController.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/22/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// The controller that uses the OnboardingItems provided by the OnboardingContext to
/// display the different onboarding slides to the user.
final class OnboardingViewController: UIViewController {
    
    // MARK: - Communication (Closures)
    
    /// Triggered when the user indicates they want to skip or are done with the
    /// onboarding slides.
    var didFinishOnboarding: EmptyClosure?
    
    
    // MARK: - Injected Properties
    
    private let mainView: OnboardingView
    private let onboardingItems: [OnboardingItem]
    
    
    // MARK: - Initializers
    
    init(mainView: OnboardingView = .init(), onboardingItems: [OnboardingItem]) {
        self.mainView = mainView
        self.onboardingItems = onboardingItems
        super.init(nibName: nil, bundle: nil)
        
        configureMainView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup Subviews
    
    /// Responsible for connecting delegates, providing relevant context info for
    /// properly displaying information, and routing events to approriate methods.
    private func configureMainView() {
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.pageControl.numberOfPages = onboardingItems.count
        mainView.didTapSkipButton = { [weak self] in
            self?.didFinishOnboarding?()
        }
    }
    
    override func loadView() {
        view = mainView
    }
}


// MARK: - UICollectionViewDataSource

extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingViewCell.identifier, for: indexPath)
        
        let onboardingItem = onboardingItems[indexPath.item]
        populate(cell, with: onboardingItem)
        
        return cell
    }
    
    /// Attempts to cast the CollectionViewCell into an OnboardingViewCell, then sets populates
    /// relevant subviews with the provided OnboardingItem
    ///
    /// - Parameters:
    ///   - cell: A UICollectionViewCell that will be cast as an OnboardingViewCell to be populated
    ///   - onboardingItem: The OnboardingItem that will be used to populate the cell
    private func populate(_ cell: UICollectionViewCell, with onboardingItem: OnboardingItem) {
        let onboardingViewCell = cell as? OnboardingViewCell
        
        onboardingViewCell?.titleLabel.text        = onboardingItem.title
        onboardingViewCell?.featureImageView.image = onboardingItem.image
        onboardingViewCell?.descriptionLabel.text  = onboardingItem.description
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // The cell should be full screen
        return collectionView.bounds.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let indexOfScrollView = calculateCurrentIndex(of: scrollView)
        
        // Checking to see if the indexOfScrollView is a whole number (it official scrolled
        // to a different slide
        let didScrollToNewIndex = indexOfScrollView == 0 || indexOfScrollView.truncatingRemainder(dividingBy: 1) == 0
        
        // Only make updates to the mainView if the scrollView is at a new index
        guard didScrollToNewIndex else { return }
        
        let index = Int(indexOfScrollView)
        mainView.pageControl.currentPage = index
        
        let title = index == onboardingItems.count - 1 ? "Done" : "Skip"
        mainView.skipButton.setTitle(title, for: .normal)
    }
    
    /// Calculates the current index of the scroll view (OnboardingView.collectionView) based
    /// on its current offset. Retruns a whole number since the OnboardingViewCells are expected
    /// to take up the whole screen
    ///
    /// - Parameter scrollView: The OnboardingView.collectionView
    /// - Returns: A whole number as a CGFloat indicating which OnboardingViewCell that is
    ///            currently presented
    private func calculateCurrentIndex(of scrollView: UIScrollView) -> CGFloat {
        let positionInScrollView = scrollView.contentOffset.x.truncatingRemainder(dividingBy: scrollView.contentSize.width)
        return positionInScrollView / scrollView.bounds.width
    }
}
