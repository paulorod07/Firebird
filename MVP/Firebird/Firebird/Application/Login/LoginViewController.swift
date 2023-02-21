//
//  LoginViewController.swift
//  Firebird
//
//  Created by Paulo Rodrigues on 21/02/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let presenter = LoginPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text = "teste@teste99.com"
        passwordTextField.text = "abc123456"
        presenter.delegate = self
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            let userModel = UserModel(email: email, password: password)
            presenter.login(userModel: userModel)
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let registerVC = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        
        registerVC?.modalPresentationStyle = .fullScreen
        
        present(registerVC ?? UIViewController(), animated: true)
    }
    
}

extension LoginViewController: LoginPresenterDelegate {
    
    func routeToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        
        homeVC?.modalPresentationStyle = .fullScreen
        
        present(homeVC ?? UIViewController(), animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
}
