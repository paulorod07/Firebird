//
//  RegisterPresenter.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 21/02/23.
//

import Foundation

protocol RegisterPresenterDelegate: AnyObject {
    func showMessage(title: String, message: String)
    func routeToHome()
}

class RegisterPresenter {
    
    weak var delegate: RegisterPresenterDelegate?
    
    func register(userModel: UserModel) {
        let provider = UserProvider()
        let business = UserBusiness(provider: provider)
        let manager = UserManager(business: business)
        
        manager.register(
            email: userModel.email,
            password: userModel.password
        ) { [weak self] result in
            
            switch result {
                case .success:
                    self?.delegate?.routeToHome()
                case .failure(let error):
                    self?.delegate?.showMessage(title: "Error", message: error.localizedDescription)
            }
            
        }
        
    }
}
