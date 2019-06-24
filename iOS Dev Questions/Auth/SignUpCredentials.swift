//
//  SignUpCredentials.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

/// An object that can only be created with valid values for each required field
struct SignUpCredentials {
    let name: Name
    let email: Email
    let password: Password
}
