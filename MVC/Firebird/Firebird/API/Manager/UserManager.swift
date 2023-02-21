//
//  UserManager.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 19/02/23.
//

import Foundation

protocol UserManagerProtocol {
    func register(
        email: String,
        password: String,
        completionHandler: @escaping (Result<UserModel, Error>) -> Void
    )
    func login(
        email: String,
        password: String,
        completionHandler: @escaping (Result<UserModel, Error>) -> Void
    )
}

class UserManager: UserManagerProtocol {
    
    let business: UserBusinessProtocol
    
    init(business: UserBusinessProtocol) {
        self.business = business
    }
    
    func register(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        
        business.register(email: email, password: password) { result in
            switch result {
                case .success(let userModel):
                    completionHandler(.success(userModel))
                case .failure(let error):
                    completionHandler(.failure(error))
            }
        }
        
    }
    
    func login(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        
        business.login(email: email, password: password) { result in
            switch result {
                case .success(let userModel):
                    completionHandler(.success(userModel))
                case .failure(let error):
                    completionHandler(.failure(error))
            }
        }
        
    }
    
}
