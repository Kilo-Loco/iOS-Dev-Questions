//
//  FirebaseDatabaseService.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import FirebaseFirestore

final class FirebaseDatabaseService {
    
    private lazy var topicsReference = database.collection("topics")
    private lazy var suggestedQuestionsReference = database.collection("suggestedQuestions")
    
    private let database: Firestore
    
    init(database: Firestore = .firestore()) {
        self.database = database
    }
    
    func add(_ question: SuggestedQuestion, completion: @escaping (Result<Bool, Error>) -> Void) {
        let suggestedQuestionData = ["value" : question.value,
                                     "answer": question.answer,
                                     "topic" : question.topic ?? ""]
        
        suggestedQuestionsReference.addDocument(data: suggestedQuestionData) {
            if let error = $0 {
                completion(.failure(error))
                
            } else {
                completion(.success(true))
            }
        }
    }
    
    func getTopics(completion: @escaping (Result<[Topic], Error>) -> Void) {
        topicsReference.getDocuments {
            if let error = $1 {
                completion(.failure(error))
                
            } else if let snapshot = $0 {
                
                let topics = snapshot.documents.compactMap { Topic(data: $0.data()) }
                completion(.success(topics))
            }
        }
    }
    
}
