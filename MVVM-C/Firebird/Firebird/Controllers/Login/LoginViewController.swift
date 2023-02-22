//
//  LoginViewController.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 21/02/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Closures
    var onRegisterButtonTapped: (() -> Void)?
    var onLoginSuccess: (() -> Void)?
    
    // MARK: - Properties
    lazy var loginView: LoginView = {
        let view = LoginView()
        
        view.onLoginButtonTapped = { [weak self] email, password in
            self?.onLoginButtonTapped(email, password)
        }
        
        view.onRegisterButtonTapped = { [weak self] in
            self?.onRegisterButtonTapped?()
        }
        
        return view
    }()
    
    // MARK: - Overrides
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }
    
    private func onLoginButtonTapped(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        
        userViewModel.getUserFromApi(email, password) { [weak self] result in
            guard let self else { return }
            switch result {
                case .success(_):
                    self.onLoginSuccess?()
                case .failure(let error):
                    self.showMessage(title: "Error", message: error.localizedDescription)
            }
        }
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
    
}
