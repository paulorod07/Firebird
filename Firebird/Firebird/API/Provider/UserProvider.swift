//
//  UserProvider.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 19/02/23.
//

import Foundation
import FirebaseAuth

protocol UserProviderProtocol {
    func register(
        parameters: [AnyHashable:Any],
        completionHandler: @escaping (Result<UserModel, Error>) -> Void
    )
    func login(
        parameters: [AnyHashable:Any],
        completionHandler: @escaping (Result<UserModel, Error>) -> Void
    )
}

class UserProvider: UserProviderProtocol {
    
    lazy var auth: Auth = Auth.auth()
    
    func register(parameters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        guard
            let body: NSDictionary = parameters[Constants.ParametersKeys.body] as? NSDictionary,
            let userModel = body[Constants.ParametersKeys.userModel] as? UserModel
        else { return }
        
        auth.createUser(withEmail: userModel.email, password: userModel.password) { result, error in
            if let error = error {
                completionHandler(.failure(error))
            }
            
            completionHandler(.success(userModel))
        }
    }
    
    func login(parameters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        guard
            let body: NSDictionary = parameters[Constants.ParametersKeys.body] as? NSDictionary,
            let userModel = body[Constants.ParametersKeys.userModel] as? UserModel
        else { return }
        
        auth.signIn(withEmail: userModel.email, password: userModel.password) { Result, error in
            if let error = error {
                completionHandler(.failure(error))
            }
            
            completionHandler(.success(userModel))
        }
    }
    
    
}
