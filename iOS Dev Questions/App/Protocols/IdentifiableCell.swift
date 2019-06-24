//
//  IdentifiableCell.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

/// Use this protocol to add a static identifier to a cell which returns a string
/// of the cell class name.
protocol IdentifiableCell: AnyObject {
    static var identifier: String { get }
}

extension IdentifiableCell {
    static var identifier: String { return String(describing: self) }
}
