//
//  AuthContext.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/21/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

final class AuthContext {
    
    var signIn: ((User) -> Void)?
    
    func signUp(with fullName: String,
                _ email: String,
                _ password: String,
                completion: @escaping (Result<User, Error>) -> Void) {
        
        do {
            let validFullName = try Name(value: fullName)
            let validEmail    = try Email(value: email)
            let validPassword = try Password(value: password)
            
            let signUpCredentials = SignUpCredentials(name: validFullName,
                                                      email: validEmail,
                                                      password: validPassword)
            
            print(signUpCredentials)
            
        } catch {
            print(error)
            completion(.failure(error))
        }
    }
    
}
