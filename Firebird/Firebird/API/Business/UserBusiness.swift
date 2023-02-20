//
//  UserBusiness.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 19/02/23.
//

import Foundation

protocol UserBusinessProtocol {
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

class UserBusiness: UserBusinessProtocol {
    
    let provider: UserProviderProtocol = UserProvider()
    
    func register(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        
        provider.register(parameters: getParameters(email, password)) { result in
            switch result {
                case .success(let userModel):
                    completionHandler(.success(userModel))
                case .failure(let error):
                    completionHandler(.failure(error))
            }
        }
        
    }
    
    func login(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        
        provider.login(parameters: getParameters(email, password)) { result in
            switch result {
                case .success(let userModel):
                    completionHandler(.success(userModel))
                case .failure(let error):
                    completionHandler(.failure(error))
            }
        }
        
    }
    
    private func getParameters(_ email: String, _ password: String) -> [AnyHashable:Any] {
        let userModel = UserModel(email: email, password: password)
        let parameters: [AnyHashable:Any] = [Constants.ParametersKeys.body:[Constants.ParametersKeys.userModel]]
        
        return parameters
    }
    
}
