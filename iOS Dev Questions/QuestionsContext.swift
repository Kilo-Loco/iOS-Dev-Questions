//
//  QuestionsContext.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

final class QuestionsContext  {
    
    // MARK: - Injected Properties
    private let database: FirebaseDatabaseService
    
    
    // MARK: - Initializer
    
    init(database: FirebaseDatabaseService = .init()) {
        self.database = database
    }
    
    
    // MARK: - Interactors
    
    func getQuestions(completion: @escaping (Result<[Topic], Error>) -> Void) {
        
    }
}
