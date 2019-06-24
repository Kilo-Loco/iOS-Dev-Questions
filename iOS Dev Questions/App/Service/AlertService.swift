//
//  AlertService.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// Creates alert controllers that can be easily presented to the user.
struct AlertService {
    
    /// Create a ViewController that can be presented with an error description displayed to the user.
    ///
    /// - Parameter error: The error that should be presented to the user.
    /// - Returns: The ViewController that displays the error message to the user.
    func generateAlert(for error: Error) -> UIViewController {
        let alert = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel)
        alert.addAction(dismissAction)
        return alert
    }
    
}
