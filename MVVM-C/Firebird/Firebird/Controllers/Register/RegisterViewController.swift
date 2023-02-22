//
//  RegisterViewController.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 21/02/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Closures
    var onRegisterSuccess: (() -> Void)?
    
    // MARK: - Properties
    lazy var registerView: RegisterView = {
        let view = RegisterView()
        
        view.onRegisterButtonTapped = { [weak self] email, password in
            self?.onRegisterButtonTapped(email, password)
        }
        
        view.onPasswordConfirmInvalid = { [weak self] in
            self?.showMessage(title: "Error", message: "Senhas não conferem")
        }
        
        return view
    }()
    
    // MARK: - Overrides
    override func loadView() {
        super.loadView()
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Registrar"
    }
    
    private func onRegisterButtonTapped(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        
        userViewModel.registerUser(email, password) { [weak self] result in
            guard let self else { return }
            switch result {
                case .success:
                    self.onRegisterSuccess?()
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
