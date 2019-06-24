//
//  Topic.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

struct Topic {
    let title: String
    let questions: [Question]
    
    init?(data: [String: Any]) {
        guard
            let title = data["title"] as? String,
            let questionsArray = data["questions"] as? [[String: Any]]
            else { return nil }
        
        let questions = questionsArray.compactMap { Question(data: $0) }
        
        self.title = title
        self.questions = questions
    }
    
}
