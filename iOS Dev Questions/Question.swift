//
//  Question.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Question {
    let value: String
    let answer: String
    let creationDate: Date
    
    init?(data: [String: Any]) {
        guard
            let value = data["value"] as? String,
            let answer = data["answer"] as? String,
            let timestamp = data["creationDate"] as? Timestamp
            else { return nil }
        
        self.value = value
        self.answer = answer
        self.creationDate = timestamp.dateValue()
    }
}
