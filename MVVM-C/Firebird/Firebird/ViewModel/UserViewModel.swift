//
//  UserViewModel.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 21/02/23.
//

import Foundation

class UserViewModel {
    
    private let model: UserModel
    
    init(model: UserModel) {
        self.model = model
    }
    
    init() {
        self.model = UserModel()
    }
    
    var email: String {
        return model.email
    }
    
    func getUserFromApi(_ email: String, _ password: String, completionHandler: @escaping (Result<UserViewModel, Error>) -> Void) {
        let manager = getManager()
        
        manager.login(email: email, password: password) { result in
            switch result {
                case .success(let userModel):
                    completionHandler(.success(UserViewModel(model: userModel)))
                case .failure(let error):
                    completionHandler(.failure(error))
            }
        }
    }
    
    func registerUser(_ email: String, _ password: String, completionHandler: @escaping (Result<UserViewModel, Error>) -> Void) {
        let manager = getManager()
        
        manager.register(email: email, password: password) { result in
            switch result {
                case .success(let userModel):
                    completionHandler(.success(UserViewModel(model: userModel)))
                case .failure(let error):
                    completionHandler(.failure(error))
            }
        }
    }
    
    private func getManager() -> UserManagerProtocol {
        let provider = UserProvider()
        let business = UserBusiness(provider: provider)
        let manager = UserManager(business: business)
        return manager
    }
    
}
