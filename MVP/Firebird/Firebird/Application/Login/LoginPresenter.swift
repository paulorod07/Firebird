//
//  LoginPresenter.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 21/02/23.
//

import Foundation

protocol LoginPresenterDelegate: AnyObject {
    func showMessage(title: String, message: String)
    func routeToHome()
}

class LoginPresenter {
    
    weak var delegate: LoginPresenterDelegate?
    
    func login(userModel: UserModel) {
        let provider = UserProvider()
        let business = UserBusiness(provider: provider)
        let manager = UserManager(business: business)
        
        manager.login(
            email: userModel.email,
            password: userModel.password
        ) { [weak self] result in
            
            switch result {
                case .success:
                    self?.routeToHome()
                case .failure(let error):
                    self?.delegate?.showMessage(title: "Error", message: error.localizedDescription)
            }
            
        }
    }
    
    func routeToHome() {
        delegate?.routeToHome()
    }
    
}
