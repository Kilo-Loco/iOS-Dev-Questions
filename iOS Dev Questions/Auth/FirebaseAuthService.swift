//
//  FirebaseAuthService.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/23/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import FirebaseAuth

final class FirebaseAuthService {
    
    private let auth = Auth.auth()
    
    func login(with credentials: LoginCredentials, completion: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: credentials.email.value,
                    password: credentials.password.value) {
                        
                        if let error = $1 {
                            completion(.failure(error))
                            
                        } else if let result = $0, let name = result.user.displayName, let email = result.user.email {
                            let user = User(name: name, email: email)
                            completion(.success(user))
                        }
        }
    }
    
    func signUp(with credentials: SignUpCredentials, completion: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: credentials.email.value,
                        password: credentials.password.value) { [weak self] in
                                
                                if let error = $1 {
                                    completion(.failure(error))
                                    
                                } else if let result = $0 {
                                    self?.update(result.user, with: credentials, completion: completion)
                                }
        }
    }
    
    private func update(_ firebaseUser: FirebaseAuth.User,
                        with credentials: SignUpCredentials,
                        completion: @escaping (Result<User, Error>) -> Void) {
        
        let changeRequest = firebaseUser.createProfileChangeRequest()
        changeRequest.displayName = credentials.name.value
        
        changeRequest.commitChanges {
            if let error = $0 {
                completion(.failure(error))
                
            } else {
                let user = User(name: changeRequest.displayName ?? credentials.name.value,
                                email: firebaseUser.email ?? credentials.email.value)
                completion(.success(user))
                
            }
        }
    }
    
}
